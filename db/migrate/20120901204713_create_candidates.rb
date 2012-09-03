class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.integer :election_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :nick_name
      t.string :rank
      t.string :phone_home
      t.string :phone_mobile
      t.date :dob
      t.string :bsa_id
      t.string :email_scout
      t.string :email_parent
      t.boolean :elected
      t.date :ordeal_date

      t.timestamps
    end
  end
end
