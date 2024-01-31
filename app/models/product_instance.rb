class ProductInstance < ApplicationRecord
  belongs_to :product_type
  belongs_to :product_batch, optional: true
end
