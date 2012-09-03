class AddTokenToElection < ActiveRecord::Migration
  def change
    add_column :elections, :token, :string
    
    Election.all.each { |e| e.generate_token; e.save; }
  end
end
