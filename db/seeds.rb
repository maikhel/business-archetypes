# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

# create roles
backend_dev_role = Role.find_or_create_by!(name: 'Backend developer')
frontend_dev_role = Role.find_or_create_by!(name: 'Frontend developer')
pm_role = Role.find_or_create_by!(name: 'PM')
architect_role = Role.find_or_create_by!(name: 'Architect')

# create people
bob = Person.find_or_create_by!(first_name: 'Bob', last_name: 'Wazowski')
alice = Person.find_or_create_by!(first_name: 'Alice', last_name: 'Wonderland')
elon = Person.find_or_create_by!(first_name: 'Elon', last_name: 'Musk')
john = Person.find_or_create_by!(first_name: 'John', last_name: 'Jetson')

# create projects
platform_project = Project.find_or_create_by!(
  name: 'Platform',
  start_at: Date.new(2021, 10, 10),
  end_at: Date.new(2023, 10, 10)
)

scooters_project = Project.find_or_create_by!(
  name: 'Scooters',
  start_at: Date.new(2022, 10, 10),
  end_at: nil
)

RoleInProject.create(project: scooters_project, person: bob, role: backend_dev_role)
RoleInProject.create(project: scooters_project, person: bob, role: frontend_dev_role)
RoleInProject.create(project: scooters_project, person: elon, role: pm_role)
RoleInProject.create(project: scooters_project, person: john, role: architect_role)

RoleInProject.create(project: platform_project, person: bob, role: backend_dev_role)
RoleInProject.create(project: platform_project, person: alice, role: frontend_dev_role)
RoleInProject.create(project: platform_project, person: elon, role: pm_role)
RoleInProject.create(project: platform_project, person: john, role: architect_role)
