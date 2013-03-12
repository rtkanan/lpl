class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :match_date
      t.integer :team_one_id
      t.integer :team_two_id
      t.integer :team_won_id
      t.references :season
      t.integer :mom_id
      t.integer :toss_won_id
      t.string :toss_selection
      t.string :status
      t.string :remarks

      t.timestamps
    end
    add_index :matches, :season_id
  end
end
