class District < ActiveRecord::Base
  attr_accessible :abbv, :division, :name
  
  has_many :elections
  has_many :users
end
