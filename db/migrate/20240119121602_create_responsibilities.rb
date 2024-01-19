class CreateResponsibilities < ActiveRecord::Migration[7.1]
  def change
    create_table :responsibilities do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
