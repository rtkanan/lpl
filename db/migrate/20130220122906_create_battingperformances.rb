class CreateBattingperformances < ActiveRecord::Migration
  def change
    create_table :battingperformances do |t|
      t.references :matchdetail
      t.integer :batsman_id
      t.integer :bat_order
      t.string :score_seq
      t.integer :runs
      t.references :wicketmode
      t.integer :bowler_id
      t.integer :fielder_id

      t.timestamps
    end
    add_index :battingperformances, :matchdetail_id
    add_index :battingperformances, :wicketmode_id
  end
end
