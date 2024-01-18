class CreateAssignedResponsibilities < ActiveRecord::Migration[7.1]
  def change
    create_table :assigned_responsibilities do |t|
      t.references :responsibility
      t.references :role

      t.timestamps
    end
  end
end
