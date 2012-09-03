class CreateDistricts < ActiveRecord::Migration
  def up
    create_table :districts do |t|
      t.string :name
      t.string :abbv
      t.string :division

      t.timestamps
    end
    
    add_column :elections, :district_id, :integer
    
    districts_json = File.read('lib/districts.json')
    districts = JSON.parse(districts_json)
    districts.each do |district|
      District.create(name: district['DI_name'], abbv: district['DI_name2'], division: district['DI_division'])
    end
    
    Election.all.each do |election|
      if election.district && District.find_by_abbv(election.district)
        election.district_id = District.find_by_abbv(election.district)
        election.save
      end
    end
    
    remove_column :elections, :district
  end
  
  def down
    drop_table :districts
  end
end
