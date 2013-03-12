class Battingperformance < ActiveRecord::Base
  belongs_to :matchdetail
  belongs_to :wicketmode
  belongs_to :batsman, :class_name => "Player", :foreign_key => 'batsman_id'
  belongs_to :bowler, :class_name => "Player", :foreign_key => 'bowler_id'
  belongs_to :fielder, :class_name => "Player", :foreign_key => 'fielder_id'
  
  attr_accessible :bat_order, :batsman_id, :bowler_id, :fielder_id, :runs, :score_seq, :wicketmode_id
end
