# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'creates a valid Person' do
    person = build(:person)
    expect(person).to be_valid
  end

  it 'has many roles among different projects' do
    bob = create(:person, name: 'Bob')
    backend_role = create(:role, name: 'backend dev', party: bob)
    frontend_role = create(:role, name: 'frontend dev', party: bob)

    platform_project = create(:project, name: 'Platform')
    scooters_project = create(:project, name: 'Scooters')
    platform_project_role = create(:role, name: 'employing project', party: platform_project)
    scooters_project_role = create(:role, name: 'employing project', party: scooters_project)

    create(:party_relationship, supplier: backend_role,
                                client: platform_project_role,
                                name: 'member_of_project')
    create(:party_relationship, supplier: frontend_role,
                                client: scooters_project_role,
                                name: 'member_of_project')

    expect(bob.projects).to match_array([platform_project, scooters_project])
    expect(bob.roles).to match_array([backend_role, frontend_role])
  end

  it 'has many supervisors for different projects' do
    bob = create(:person, name: 'Bob')
    john = create(:person, name: 'John')
    alice = create(:person, name: 'Alice')

    subordinate_bob_role = create(:role, name: 'subordinate', party: bob)
    supervisor_john_role = create(:role, name: 'supervisor', party: john)
    supervisor_alice_role = create(:role, name: 'supervisor', party: alice)

    create(:party_relationship, supplier: supervisor_john_role,
                                client: subordinate_bob_role,
                                name: 'reports_to')
    create(:party_relationship, supplier: supervisor_alice_role,
                                client: subordinate_bob_role,
                                name: 'reports_to')

    expect(bob.supervisors).to match_array([john, alice])
    expect(john.subordinates).to match_array([bob])
    expect(alice.subordinates).to match_array([bob])
  end
end
