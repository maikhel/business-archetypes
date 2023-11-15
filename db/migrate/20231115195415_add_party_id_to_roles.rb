class AddPartyIdToRoles < ActiveRecord::Migration[7.1]
  def change
    add_reference :roles, :party, polymorphic: true
  end
end
