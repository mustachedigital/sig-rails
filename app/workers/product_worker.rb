class ProductWorker
  include Sidekiq::Worker
  def perform(attributes)
    product = Spree::Product.create(attributes)
    p attributes
    if product.save
    	p "sabe"
    else
    	p product.errors.full_messages.join(", ")
    end
  end
end