class CreateSupervisions < ActiveRecord::Migration[7.1]
  def change
    create_table :supervisions do |t|
      t.references :project, foreign_key: true
      t.references :supervisor, foreign_key: { to_table: :people }
      t.references :subordinate, foreign_key: { to_table: :people }

      t.timestamps
    end
  end
end
