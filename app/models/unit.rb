class Unit < ActiveResource::Base
  self.site = "https://scouting.io/"

  schema do
    integer "program_id", "district_id", "number"
  end

  def district
    District.find(district_id)
  end

  #belongs_to :program
  #belongs_to :district
  #has_one :division, through: :district
  #has_one :council, through: :division
  #has_many :memberships, :as => :group

  #attr_accessible :number, :district, :program, :program_id, :district_id, :code
end
