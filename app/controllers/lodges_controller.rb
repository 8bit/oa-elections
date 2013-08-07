class LodgesController < ApplicationController
	def index
		@lodges = current_lodges
	end

	def teams
		@teams = Team.where(lodge_id: params['id'])
	end

	def users
		@users = User.where("team_id IN (?)", Team.where(lodge_id: params['id']).pluck(:id))
	end
end
