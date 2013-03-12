class CreateBowlingperformances < ActiveRecord::Migration
  def change
    create_table :bowlingperformances do |t|
      t.references :matchdetail
      t.integer :bowler_id
      t.integer :over_no
      t.string :bowl_seq
      t.integer :conceded
      t.integer :wickets

      t.timestamps
    end
    add_index :bowlingperformances, :matchdetail_id
  end
end
