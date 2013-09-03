class WelcomeController < ApplicationController
  def index
  	if current_user && current_user.team.present?
  		redirect_to elections_team_path(current_user.team)
  	else
    	render
    end
  end
end
