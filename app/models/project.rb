# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :role_in_projects
  has_many :members, through: :role_in_projects, source: :person
  has_many :roles, through: :role_in_projects, source: :role
end
