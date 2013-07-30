class AddTeamIdToElections < ActiveRecord::Migration
  def up
    add_column :elections, :team_id, :integer

    Election.all.each do |election|
    	election.team = Team.find_or_create_by_name(name: election.district.name, lodge_id: 107)
    	election.save
    end
  end
end
