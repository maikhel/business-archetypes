# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'creates a valid Person' do
    person = build(:person)
    expect(person).to be_valid
  end
end
