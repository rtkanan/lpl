class Wicketmode < ActiveRecord::Base
  has_many :battingperformances
  attr_accessible :mode
end
