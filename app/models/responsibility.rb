class Responsibility < ApplicationRecord
  has_many :role_type_responsibilities
  has_many :role_types, through: :role_type_responsibilities

  has_many :assigned_responsibilities
end
