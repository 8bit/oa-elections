class Addteamtousers < ActiveRecord::Migration
  def up
  	add_column :users, :team_id, :integer
  end

  def down
  end
end
