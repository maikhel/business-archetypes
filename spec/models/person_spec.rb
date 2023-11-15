# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'creates a valid Person' do
    person = build(:person)
    expect(person).to be_valid
  end

  it 'many roles among different projects' do
    bob = create(:person, name: 'Bob')
    backend_role = create(:role, name: 'backend dev')
    frontend_role = create(:role, name: 'frontend dev')

    platform_project = create(:project, name: 'Platform')
    scooters_project = create(:project, name: 'Scooters')

    create(:role_in_project, person: bob, role: backend_role,
                             project: platform_project)
    create(:role_in_project, person: bob, role: frontend_role,
                             project: scooters_project)

    expect(bob.projects).to match_array([platform_project, scooters_project])
    expect(bob.roles).to match_array([backend_role, frontend_role])
  end

  it 'has many supervisors for different projects' do
    bob = create(:person, name: 'Bob')
    john = create(:person, name: 'John')
    alice = create(:person, name: 'Alice')

    platform_project = create(:project, name: 'Platform')
    scooters_project = create(:project, name: 'Scooters')

    create(:supervision, subordinate: bob, supervisor: john,
                         project: platform_project)
    create(:supervision, subordinate: bob, supervisor: alice,
                         project: scooters_project)

    expect(bob.supervisors).to match_array([john, alice])
    expect(john.subordinates).to match_array([bob])
    expect(alice.subordinates).to match_array([bob])
  end
end
