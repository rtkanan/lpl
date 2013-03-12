class Tossselection < ActiveRecord::Base
  has_one :matches
  attr_accessible :option
end
