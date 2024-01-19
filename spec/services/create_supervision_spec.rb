# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateSupervision, type: :model do
  describe 'call' do
    it 'creates supervision with all responsibilities' do
      bob = create(:person, name: 'Bob')
      john = create(:person, name: 'John')

      preparing_reports_reponsibility = create(:responsibility, name: 'preparing reports', role_name: 'subordinate')
      scheduling_meetings_reponsibility = create(:responsibility, name: 'scheduling meetings', role_name: 'supervisor')
      mentoring_reponsibility = create(:responsibility, name: 'mentoring', role_name: 'supervisor')

      service = described_class.new(supervisor: john, subordinate: bob)

      expect(service.call).to eq true

      expect(bob.supervisors).to match_array([john])
      expect(
        bob.assigned_responsibilities.pluck(:responsibility_id)
      ).to match_array([preparing_reports_reponsibility.id])

      expect(john.subordinates).to match_array([bob])
      expect(
        john.assigned_responsibilities.pluck(:responsibility_id)
      ).to match_array([scheduling_meetings_reponsibility.id, mentoring_reponsibility.id])
    end
  end
end
