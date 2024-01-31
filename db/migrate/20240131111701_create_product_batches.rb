class CreateProductBatches < ActiveRecord::Migration[7.1]
  def change
    create_table :product_batches do |t|
      t.string :start_serial_number
      t.string :end_serial_number

      t.references :product_type

      t.timestamps
    end
  end
end
