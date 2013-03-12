class Matchplayer < ActiveRecord::Base
  belongs_to :match
  belongs_to :team
  belongs_to :player
  attr_accessible :match_id, :team_id, :player_id
end
