class Team < ActiveRecord::Base
  attr_accessible :name
  
  has_many :seasons
  has_many :playerbonds
  has_many :matchplayers
end
