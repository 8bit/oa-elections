class LodgesController < ApplicationController
	def index
		@lodges = current_lodges
	end

	def teams
		@teams = Team.where(lodge_id: params['id'])
	end
end
