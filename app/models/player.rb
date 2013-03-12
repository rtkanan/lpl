class Player < ActiveRecord::Base
  attr_accessible :name, :nick_name
  
  has_many :seasons
  has_many :playerbonds
  has_many :matchplayers
end
