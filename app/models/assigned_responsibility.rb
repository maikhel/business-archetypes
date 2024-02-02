class AssignedResponsibility < ApplicationRecord
  belongs_to :role
  belongs_to :responsibility
end
