# frozen_string_literal: true

class CreateBatchOfProducts
  BATCH_SIZE = 3

  def self.call(product_type)
    ActiveRecord::Base.transaction do
      product_batch = ProductBatch.create!(product_type:)

      BATCH_SIZE.times do |n|
        product_instance = ProductInstance.new(product_type:, product_batch:)

        product_instance.serial_number = serial_number_for(n)
        product_instance.save!
      end

      product_batch.update!(
        start_serial_number: product_batch.product_instances.first.serial_number,
        end_serial_number: product_batch.product_instances.last.serial_number
      )
    end

    true
  end

  def self.serial_number_for(num)
    "#{num}_#{SecureRandom.uuid}" # or some more sophisticated logic
  end
end
