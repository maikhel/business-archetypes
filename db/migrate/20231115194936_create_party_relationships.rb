class CreatePartyRelationships < ActiveRecord::Migration[7.1]
  def change
    create_table :party_relationships do |t|
      t.string :name
      t.string :description

      t.references :supplier, polymorphic: true
      t.references :client, polymorphic: true

      t.timestamps
    end
  end
end
