# frozen_string_literal: true

class CreateSupervision
  def self.call(supervisor:, subordinate:)
    ActiveRecord::Base.transaction do
      Supervision.create!(subordinate:, supervisor:)

      Responsibility.where(role_name: 'subordinate').each do |responsibility|
        AssignedResponsibility.create!(person: subordinate, responsibility:)
      end

      Responsibility.where(role_name: 'supervisor').each do |responsibility|
        AssignedResponsibility.create!(person: supervisor, responsibility:)
      end
    end

    true
  end
end
