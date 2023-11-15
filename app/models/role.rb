# frozen_string_literal: true

class Role < ApplicationRecord
  belongs_to :party, polymorphic: true

  has_many :supplier_relationships, class_name: 'PartyRelationship', as: :supplier, foreign_key: :supplier_id
  has_many :client_relationships, class_name: 'PartyRelationship', as: :client, foreign_key: :client_id
end
