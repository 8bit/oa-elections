class CreateElections < ActiveRecord::Migration
  def change
    create_table :elections do |t|
      t.string :unit_type
      t.string :unit_number
      t.string :district
      t.datetime :held_at
      t.string :location
      t.integer :num_scouts_active
      t.integer :num_scouts_present
      t.integer :num_scouts_eligible
      t.integer :ballot_one_count
      t.integer :ballot_two_count
      t.boolean :no_candidates
      t.boolean :election_refused
      t.boolean :camp_promotion
      t.boolean :camp_promotion_refused

      t.timestamps
    end
  end
end
