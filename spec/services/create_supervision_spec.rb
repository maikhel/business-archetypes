# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateSupervision, type: :model do
  describe 'call' do
    it 'creates supervision with all responsibilities' do
      bob = create(:person, name: 'Bob')
      john = create(:person, name: 'John')

      service = described_class.new(supervisor: john, subordinate: bob)

      expect(service.call).to eq true

      expect(bob.supervisors).to match_array([john])
      expect(john.subordinates).to match_array([bob])
    end
  end
end
