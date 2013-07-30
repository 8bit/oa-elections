class Team < ActiveRecord::Base
  attr_accessible :lodge_id, :name
  has_many :elections
end
