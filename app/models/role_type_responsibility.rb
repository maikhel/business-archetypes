class RoleTypeResponsibility < ApplicationRecord
  belongs_to :responsibility
  belongs_to :role_type
end
