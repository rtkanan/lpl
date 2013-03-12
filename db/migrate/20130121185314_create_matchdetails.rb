class CreateMatchdetails < ActiveRecord::Migration
  def change
    create_table :matchdetails do |t|
      t.references :match
      t.integer :bat_team_id
      t.integer :bowl_team_id
      t.integer :score
      t.integer :wickets
      t.integer :overs
      t.integer :innings
      t.integer :extras

      t.timestamps
    end
    add_index :matchdetails, :match_id
  end
end
