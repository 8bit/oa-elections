class WelcomeController < ApplicationController
  def index
  	if current_user
  		redirect_to elections_team_path(current_user.team)
  	else
    	render
    end
  end
end
