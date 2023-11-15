class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
