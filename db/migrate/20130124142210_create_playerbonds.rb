class CreatePlayerbonds < ActiveRecord::Migration
  def change
    create_table :playerbonds do |t|
      t.references :player
      t.references :team
      t.references :season
      t.string :auction_price
      t.string :grade

      t.timestamps
    end
    add_index :playerbonds, :player_id
    add_index :playerbonds, :team_id
    add_index :playerbonds, :season_id
  end
end
