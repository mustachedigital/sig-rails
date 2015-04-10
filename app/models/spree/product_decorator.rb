module Spree
	Product.class_eval do

		attr_accessor :bulk_images
		after_create :upload_bulk_images

		def upload_bulk_images
			unless bulk_images.blank?
				bulk_images.each do |url|
					self.images.build.attachment = URI.parse(url) unless url.blank?
				end
				self.save
			end
		end

	end
end