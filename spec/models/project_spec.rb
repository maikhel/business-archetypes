require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'has many members and roles' do
    platform_project = create(:project, name: 'Platform')

    bob = create(:person, name: 'Bob')
    alice = create(:person, name: 'Alice')

    backend_role = create(:role, name: 'backend dev')
    frontend_role = create(:role, name: 'frontend dev')

    create(:role_in_project, person: bob, role: backend_role,
                             project: platform_project)
    create(:role_in_project, person: bob, role: frontend_role,
                             project: platform_project)
    create(:role_in_project, person: alice, role: frontend_role,
                             project: platform_project)

    expect(platform_project.members.uniq).to match_array([alice, bob])
    expect(platform_project.roles.uniq).to match_array([backend_role, frontend_role])
  end
end
