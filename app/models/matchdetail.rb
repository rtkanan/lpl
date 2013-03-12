class Matchdetail < ActiveRecord::Base
  belongs_to :match
  belongs_to :bat_team, :class_name => "Team", :foreign_key => 'bat_team_id'
  belongs_to :bowl_team, :class_name => "Team", :foreign_key => 'bowl_team_id'
  
  has_many :battingperformances, :dependent => :destroy
  accepts_nested_attributes_for :battingperformances
  
  has_many :bowlingperformances, :dependent => :destroy
  accepts_nested_attributes_for :bowlingperformances
  
  attr_accessible :bat_team_id, :bowl_team_id, :extras, :innings, :overs, :score, :wickets, :battingperformances_attributes, :bowlingperformances_attributes
end
