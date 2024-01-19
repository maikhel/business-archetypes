class AddRoleNameToResponsibilities < ActiveRecord::Migration[7.1]
  def change
    add_column :responsibilities, :role_name, :string
  end
end
