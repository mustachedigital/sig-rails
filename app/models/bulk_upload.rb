class BulkUpload < ActiveRecord::Base

	include ActionView::Helpers::JavaScriptHelper

	has_attached_file :file,
      SigRails::Configuration.paperclip_options[:bulk_uploads][:file]
  validates_attachment :file, content_type: { content_type: ['text/csv','text/comma-separated-values','text/csv','application/csv','application/excel','application/vnd.ms-excel','application/vnd.msexcel','text/anytext','text/plain', "application/pdf","application/vnd.ms-excel","application/vnd.openxmlformats-officedocument.spreadsheetml.sheet","application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain"] }
  after_create :send_to_queue

  def upload_products
    file = Roo::Spreadsheet.open(self.file.url)
    field_names = file.sheet("Bulkload").row(2)
    (5..file.last_row).to_a.each do |i|
      attributes = {}
      row = file.sheet("Bulkload").row(i)
      
      field_names.each_with_index do |field_name, j|
      	item = row[j].to_s
      	if BULK_MAPPING[field_name.strip] && !item.try(:strip).blank?
	      	if BULK_MAPPING[field_name.strip].split(",").first == ":pp"
	      		attributes[:product_properties_attributes] ||= []
	          attributes[:product_properties_attributes] << {property_name: BULK_MAPPING[field_name.strip].split(",").last, value: item.try(:strip)}
	      	else
	      		eval(%{attributes[#{BULK_MAPPING[field_name.try(:strip)]}] = "#{escape_javascript(item.try(:strip))}"}) unless BULK_MAPPING[field_name.strip].blank?
	      	end
	      end
      end
      unless attributes[:sku].blank?
      	ProductWorker.perform_async(attributes.merge(shipping_category_id: Spree::ShippingCategory.first.id, available_on: Date.today))
      end
    end
  end

  private 

  	def send_to_queue
  		FileParserWorker.perform_async(self.id)
  	end

end