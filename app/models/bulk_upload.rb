class BulkUpload < ActiveRecord::Base

	has_attached_file :file,
      SigRails::Configuration.paperclip_options[:bulk_uploads][:file]
  validates_attachment :file, content_type: { content_type: ['text/csv','text/comma-separated-values','text/csv','application/csv','application/excel','application/vnd.ms-excel','application/vnd.msexcel','text/anytext','text/plain'] }
  after_create :send_to_queue

  # private 

  	def send_to_queue
  		FileParserWorker.perform_async(self.id)
  	end

end