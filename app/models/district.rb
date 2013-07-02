class District < ActiveRecord::Base
  has_many :elections
  has_many :users
end
