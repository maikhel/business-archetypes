class CreateProductInstances < ActiveRecord::Migration[7.1]
  def change
    create_table :product_instances do |t|
      t.string :serial_number
      t.references :product_type

      t.timestamps
    end
  end
end
