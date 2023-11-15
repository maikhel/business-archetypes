# frozen_string_literal: true

class RoleInProject < ApplicationRecord
  belongs_to :project
  belongs_to :person
  belongs_to :role
end
