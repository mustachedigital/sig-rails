module Spree
  Taxon.class_eval do
  	
  	has_attached_file :icon,
      SigRails::Configuration.paperclip_options[:taxons][:icon]

    validates_attachment :icon,
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  end
end