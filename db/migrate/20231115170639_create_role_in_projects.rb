# frozen_string_literal: true

class CreateRoleInProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :role_in_projects do |t|
      t.references :project, foreign_key: true
      t.references :person, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
