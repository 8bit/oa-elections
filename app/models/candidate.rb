class Candidate < ActiveRecord::Base
  belongs_to :election
  attr_accessible :bsa_id, :dob, :elected, :election_id, :email_parent, :email_scout, :first_name, :last_name, :middle_name, :nick_name, :ordeal_date, :phone_home, :phone_mobile, :rank

  validates :first_name, :presence => true
  validates :last_name, :presence => true
   
   scope :elected, where(:elected => true) 
   
  def display_name
    self.last_name + ", " + ((self.nick_name.present?) ? self.nick_name : self.first_name)
  end
  
  def age
    dob.present? ? Date.today.year - dob.year : "Unknown"
  end

  def complete?
    (first_name.present? && last_name.present?) &&
    bsa_id.present? &&
    dob.present? &&
    rank.present? &&
    (phone_home.present? || phone_mobile.present?) &&
    (email_scout.present? || email_parent.present?)
  end
end

