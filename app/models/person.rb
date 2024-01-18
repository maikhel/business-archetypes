# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :roles, as: :party

  has_many :client_relationships, through: :roles, source: :client_relationships, class_name: 'PartyRelationship'
  has_many :supplier_relationships, through: :roles, source: :supplier_relationships, class_name: 'PartyRelationship'

  has_many :assigned_responsibilities, through: :roles

  def projects
    Project.joins(roles: [:client_relationships])
           .where(
             client_relationships: { id: supplier_relationships.where(name: 'member_of_project') }
           )
  end

  def supervisors
    Person.joins(roles: [:supplier_relationships])
          .where(
            supplier_relationships: { id: client_relationships.where(name: 'reports_to') }
          )
  end

  def subordinates
    Person.joins(roles: [:client_relationships])
          .where(
            client_relationships: { id: supplier_relationships.where(name: 'reports_to') }
          )
  end
end
