class Season < ActiveRecord::Base
  attr_accessible :from, :mos_id, :name, :to, :winner_id
  belongs_to :mos, :class_name => "Player", :foreign_key => 'mos_id'
  belongs_to :winner, :class_name => "Team", :foreign_key => 'winner_id'
  
  has_many :matches, :dependent => :destroy
  has_many :playerbonds, :dependent => :destroy
end
