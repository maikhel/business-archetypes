# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :roles, as: :party

  has_many :client_relationships, through: :roles, source: :client_relationships, class_name: 'PartyRelationship'
  has_many :supplier_relationships, through: :roles, source: :supplier_relationships, class_name: 'PartyRelationship'
end
