class FileParserWorker
  include ActionView::Helpers::JavaScriptHelper
  include Sidekiq::Worker
  def perform(bulk_upload_id)
    bulk_upload = BulkUpload.where(id: bulk_upload_id).first
    rows = CSV.read(open(bulk_upload.file.url), :quote_char => "|")
    field_names = rows.shift
    rows.each do |row|
    	attributes = {}
    	field_names.each_with_index do |field_name, i|
        if BULK_MAPPING[field_name.strip].split(",").first == ":img"

        elsif BULK_MAPPING[field_name.strip].split(",").first != ":pp"
    		  eval(%{attributes[#{BULK_MAPPING[field_name.strip]}] = "#{escape_javascript(row[i].strip)}"})
        else
          property = Spree::Property.where(name: BULK_MAPPING[field_name.strip].split(",").last).last
          attributes[:product_properties_attributes] ||= []
          attributes[:product_properties_attributes] << {property_id: property.id, value: row[i].strip}
        end
    	end
    	ProductWorker.perform_async(attributes.merge(shipping_category_id: Spree::ShippingCategory.first.id, available_on: Date.today))
		end
  end
end