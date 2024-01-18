class RoleType < ApplicationRecord
  has_many :roles
  has_many :role_type_responsibilities
  has_many :responsibilities, through: :role_type_responsibilities
end
