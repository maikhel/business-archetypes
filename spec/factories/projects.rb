# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { 'MyString' }
    start_at { '2023-11-15' }
    end_at { '2023-11-15' }
  end
end
