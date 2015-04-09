class FileParserWorker
  include Sidekiq::Worker
  def perform(bulk_upload_id)
    bulk_upload = BulkUpload.where(id: bulk_upload_id).first
    rows = CSV.parse(open(bulk_upload.file.url).read())
    field_names = rows.shift
    rows.each do |row|
    	attributes = {}
    	field_names.each_with_index do |field_name, i|
    		attributes[field_name] = row[i]
    	end
    	ProductWorker.perform_async(attributes)
		end
  end
end