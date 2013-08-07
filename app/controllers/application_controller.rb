class ApplicationController < ActionController::Base
  protect_from_forgery
 
   rescue_from OAuth2::Error do |exception|
    if exception.response.status == 401
      session[:user_id] = nil
      session[:access_token] = nil
      redirect_to root_url, alert: "Access token expired, try signing in again."
    end
  end

private

  def oauth_client
    @oauth_client ||= OAuth2::Client.new(ENV["OAUTH_ID"], ENV["OAUTH_SECRET"], site: ENV['KEKEEWIN_URL'])
  end

  def access_token
    if session[:access_token]
      @access_token ||= OAuth2::AccessToken.new(oauth_client, session[:access_token])
    end
  end

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      session[:user_id] = nil
    end
  end
  helper_method :current_user
  
  def current_memberships
    begin
      @memberships ||= session[:memberships] if session[:user_id]
    rescue
      session[:user_id] = nil
    end
  end
  helper_method :current_memberships

  def current_lodge
    begin
      @lodge ||= current_memberships.select { |membership| membership['group_type'] == 'Lodge' }.map { |membership| access_token.get("/api/lodges/#{membership['group_id']}").parsed }.first if current_memberships 
    rescue
      session[:user_id] = nil
    end
  end
  helper_method :current_lodge

  def current_lodges
    begin
      @lodges ||= current_memberships.select { |membership| membership['group_type'] == 'Lodge' }.map { |membership| access_token.get("/api/lodges/#{membership['group_id']}").parsed } if current_memberships 
    rescue
      session[:user_id] = nil
    end
  end
  helper_method :current_lodges

  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_url
    end
  end

	def require_user
	  redirect_to login_url, alert: "Not authorized" if current_user.nil?
	end

  def require_admin
    redirect_to login_url, alert: "Not authorized" unless current_user && current_user.admin?
  end
  
end
