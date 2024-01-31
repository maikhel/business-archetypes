class AddBatchIdToProductInstances < ActiveRecord::Migration[7.1]
  def change
    add_column :product_instances, :product_batch_id, :integer
  end
end
