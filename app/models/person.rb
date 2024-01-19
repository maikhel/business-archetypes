# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :role_in_projects
  has_many :projects, through: :role_in_projects
  has_many :roles, through: :role_in_projects

  has_many :assigned_responsibilities

  has_many :supervisors_relationships, foreign_key: :subordinate_id, class_name: 'Supervision'
  has_many :supervisors, through: :supervisors_relationships, source: :supervisor
  has_many :subordinates_relationships, foreign_key: :supervisor_id, class_name: 'Supervision'
  has_many :subordinates, through: :subordinates_relationships, source: :subordinate
end
