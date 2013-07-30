class CreateUsers < ActiveRecord::Migration
  drop_table :users
  def change
    create_table :users do |t|
      t.string :provider
      t.string :email
      t.string :uid
      t.boolean :admin
      t.boolean :active

      t.timestamps
    end
  end
end
