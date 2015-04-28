class ProductWorker
  include Sidekiq::Worker
  def perform(attributes)
    product = Spree::Product.create(attributes)
    if product.save
      p "product saved"
    else
    	p product.errors.full_messages.join(", ")
    end
  end
end