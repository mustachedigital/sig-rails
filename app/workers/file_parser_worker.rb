class FileParserWorker
  include ActionView::Helpers::JavaScriptHelper
  include Sidekiq::Worker
  
  def perform(bulk_upload_id)
    BulkUpload.where(id: bulk_upload_id).first.upload_products
  end
end