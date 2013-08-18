class Election < ActiveRecord::Base
  has_many :candidates
  belongs_to :district
  belongs_to :team
  
  attr_accessible :team_id, :ballot_one_count, :ballot_two_count, :camp_promotion, :camp_promotion_refused, :district_id, :election_refused, :held_at, :location, :no_candidates, :num_scouts_active, :num_scouts_eligible, :num_scouts_present, :unit_number, :unit_type, :coordinator_name, :coordinator_email, :coordinator_phone
  
  validates :unit_type, :presence => true
  validates :unit_number, :presence => true
  validates :unit_number, :uniqueness => true
  validates :team, :presence => true
  
  before_create :generate_token

  def self.scheduled
    Election.all.delete_if { |election| !election.scheduled? }
  end
  
  def unit
    self.unit_type + " " + self.unit_number
  end
  
  def held_on
    held_at.to_date
  end
  
  def status
    if self.election_refused?
      "refused"
    else
      if self.candidates.pluck(:elected).include? true
        "completed"
      else
         "pending"
       end
    end
  end
  
  def scheduled?
    self.held_at.present? && self.location.present? && !self.election_refused? && !self.no_candidates?
  end
  
  def generate_token
    begin
      token = SecureRandom.hex(13)
     end while Election.where(:token => token).exists?
     self.token = token
  end
end
