class AddContactToElections < ActiveRecord::Migration
  def change
    add_column :elections, :coordinator_name, :string
    add_column :elections, :coordinator_email, :string
    add_column :elections, :coordinator_phone, :string
  end
end
