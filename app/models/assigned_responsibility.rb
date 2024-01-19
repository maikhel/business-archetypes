class AssignedResponsibility < ApplicationRecord
  belongs_to :person
  belongs_to :responsibility
end
