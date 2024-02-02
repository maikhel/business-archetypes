class CreateRoleTypeResponsibilities < ActiveRecord::Migration[7.1]
  def change
    create_table :role_type_responsibilities do |t|
      t.references :role_type
      t.references :responsibility

      t.timestamps
    end
  end
end
