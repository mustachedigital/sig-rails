module Spree
  Taxon.class_eval do
  	
  	has_attached_file :attachment,
      SigRails::Configuration.paperclip_options[:taxons][:attachment]
    validates_attachment :attachment, content_type: { content_type: /\Aimage\/.*\Z/ }
  end
end