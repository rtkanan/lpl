class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.date :from
      t.date :to
      t.integer :winner_id
      t.integer :mos_id
      t.string :name

      t.timestamps
    end
  end
end
