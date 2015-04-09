class ProductWorker
  include Sidekiq::Worker
  def perform(attributes)
    p attributes
  end
end