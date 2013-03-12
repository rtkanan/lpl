class CreateMatchplayers < ActiveRecord::Migration
  def change
    create_table :matchplayers do |t|
      t.references :match
      t.references :team
      t.references :player

      t.timestamps
    end
    add_index :matchplayers, :match_id
    add_index :matchplayers, :team_id
    add_index :matchplayers, :player_id
  end
end
