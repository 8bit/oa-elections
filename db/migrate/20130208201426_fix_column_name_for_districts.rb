class FixColumnNameForDistricts < ActiveRecord::Migration
  def change
    rename_column :districts, :abbv, :code
    rename_column :districts, :division, :division_id
  end
end
