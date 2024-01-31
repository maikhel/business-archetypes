class ProductType < ApplicationRecord
  has_many :product_instances
  has_many :product_batches
end
