class Match < ActiveRecord::Base
  belongs_to :season
  belongs_to :team_one, :class_name => "Team", :foreign_key => 'team_one_id'
  belongs_to :team_two, :class_name => "Team", :foreign_key => 'team_two_id'
  belongs_to :team_won, :class_name => "Team", :foreign_key => 'team_won_id'
  belongs_to :toss_won, :class_name => "Team", :foreign_key => 'toss_won_id'
  belongs_to :mom, :class_name => "Player", :foreign_key => 'mom_id'
  belongs_to :tossselection
  
  has_many :matchdetails, :dependent => :destroy
  has_many :matchplayers, :dependent => :destroy
  accepts_nested_attributes_for :matchplayers
  
  
  attr_accessible :match_date, :mom_id, :remarks, :status, :team_one_id, :team_two_id, :team_won_id, :tossselection_id, :toss_won_id, :matchplayers_attributes
end
