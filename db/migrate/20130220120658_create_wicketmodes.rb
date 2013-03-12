class CreateWicketmodes < ActiveRecord::Migration
  def change
    create_table :wicketmodes do |t|
      t.string :mode

      t.timestamps
    end
  end
end
