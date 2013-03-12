class FixColumnToss < ActiveRecord::Migration
  def up
    rename_column :matches, :toss_selection, :tossselection_id
  end

  def down
  end
end
