class ProductBatch < ApplicationRecord
  has_many :product_instances
  belongs_to :product_type
end
