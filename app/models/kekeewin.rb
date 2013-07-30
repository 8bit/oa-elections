module Kekeewin

  mattr_accessor :access_token

	class Lodge
		def self.all
			@lodges ||= Kekeewin.access.get("/api/lodges").parsed
		end
  end

  def self.oauth_client
    @oauth_client ||= OAuth2::Client.new(ENV["OAUTH_ID"], ENV["OAUTH_SECRET"], site: ENV['KEKEEWIN_URL'])
  end

  def self.access
    if Kekeewin.access_token
      @access_token ||= OAuth2::AccessToken.new(oauth_client, Kekeewin.access_token)
    end
  end 
end