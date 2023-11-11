# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  it 'creates a valid Organization' do
    organization = build(:organization)
    expect(organization).to be_valid
  end
end
