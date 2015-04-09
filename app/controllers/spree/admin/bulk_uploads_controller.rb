module Spree
module Admin
  class BulkUploadsController < Spree::Admin::BaseController

  	def new
  		@bulk_upload = BulkUpload.new
  	end

	  def create
	    @bulk_upload = BulkUpload.new(bulk_upload_params)
      if @bulk_upload.save
        redirect_to new_admin_bulk_upload_url, notice: 'Address successfully created.'
      else
        redirect_to new_admin_bulk_upload_url, notice: @bulk_upload.errors.full_messages.join(", ")
      end
	  end

	  private

	  def bulk_upload_params
      params.require(:bulk_upload).permit(:file)
    end

  end
end
end