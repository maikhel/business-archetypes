# frozen_string_literal: true

class CreateSupervision
  def initialize(supervisor:, subordinate:)
    @supervisor = supervisor
    @subordinate = subordinate
  end

  def call
    ActiveRecord::Base.transaction do
      Supervision.create(subordinate:, supervisor:)
    end

    true
  end

  private

  attr_reader :subordinate, :supervisor
end
