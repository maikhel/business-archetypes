# frozen_string_literal: true

class CreateSupervision
  def initialize(supervisor:, subordinate:)
    @supervisor = supervisor
    @subordinate = subordinate
  end

  def call
    supervisor_role_type = RoleType.find_by(name: 'supervisor')
    subordinate_role_type = RoleType.find_by(name: 'subordinate')

    ActiveRecord::Base.transaction do
      subordinate_role = Role.create(role_type: subordinate_role_type, party: subordinate)
      supervisor_role = Role.create(role_type: supervisor_role_type, party: supervisor)

      PartyRelationship.create(name: 'reports_to', supplier: supervisor_role, client: subordinate_role)

      subordinate_role_type.responsibilities.each do |responsibility|
        AssignedResponsibility.create(role: subordinate_role, responsibility:)
      end

      supervisor_role_type.responsibilities.each do |responsibility|
        AssignedResponsibility.create(role: supervisor_role, responsibility:)
      end
    end

    true
  end

  private

  attr_reader :supervisor, :subordinate
end
