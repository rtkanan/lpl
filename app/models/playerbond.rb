class Playerbond < ActiveRecord::Base
  belongs_to :player
  belongs_to :team
  belongs_to :season
  validates :player_id, :team_id, :season_id, :auction_price, :presence => true
  validates :auction_price, :numericality => { :only_integer => true }
  attr_accessible :player_id, :team_id, :season_id, :auction_price, :grade
end
