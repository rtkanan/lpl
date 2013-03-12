class Bowlingperformance < ActiveRecord::Base
  belongs_to :matchdetail
  belongs_to :bowler, :class_name => "Player", :foreign_key => 'bowler_id'
  
  attr_accessible :bowl_seq, :bowler_id, :conceded, :over_no, :wickets
end
