class CreateTossselections < ActiveRecord::Migration
  def change
    create_table :tossselections do |t|
      t.string :option

      t.timestamps
    end
  end
end
