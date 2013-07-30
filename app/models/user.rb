class User < ActiveRecord::Base  
  attr_accessible :email, :provider, :uid

  # before_create :generate_uuid

  # def to_param
  #   "#{uuid}"
  # end

  def admin?
    true
  end

  def lodge_id
    105
  end
  
  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end
  
  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.email = auth["info"]["email"]
    end
  end

  private

  # def generate_uuid
  #   self.uuid = SecureRandom.uuid
  # end

end
