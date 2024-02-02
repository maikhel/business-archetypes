# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateSupervision do
  describe 'call' do
    it 'assigns supervisor with all responsibilities' do
      bob = create(:person, name: 'Bob')
      john = create(:person, name: 'John')

      subordinate_role_type = create(:role_type, name: 'subordinate')
      supervisor_role_type = create(:role_type, name: 'supervisor')

      preparing_reports_reponsibility = create(:responsibility, name: 'preparing reports')
      scheduling_meetings_reponsibility = create(:responsibility, name: 'scheduling meetings')
      mentoring_reponsibility = create(:responsibility, name: 'mentoring')

      subordinate_role_type.responsibilities << preparing_reports_reponsibility
      supervisor_role_type.responsibilities << scheduling_meetings_reponsibility
      supervisor_role_type.responsibilities << mentoring_reponsibility

      expect(
        described_class.call(subordinate: bob, supervisor: john)
      ).to eq true

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
