class PartyRelationship < ApplicationRecord
  belongs_to :supplier, class_name: 'Role', polymorphic: true
  belongs_to :client, class_name: 'Role', polymorphic: true
end
