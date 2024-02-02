class AddRoleTypeIdToRole < ActiveRecord::Migration[7.1]
  def change
    add_reference :roles, :role_type
  end
end
