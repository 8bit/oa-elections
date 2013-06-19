class District < ActiveResource::Base
  self.site = "http://scouting.io/"

  schema do
    string "name", "code"
    integer "division_id"
  end
  
  def elections
    Elections.where(district_id: self.id)
  end

  def users
    Users.where(district_id: self.id)
  end

  #has_many :elections
  #has_many :users
end
