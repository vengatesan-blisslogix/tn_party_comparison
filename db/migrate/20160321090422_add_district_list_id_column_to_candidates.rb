class AddDistrictListIdColumnToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :district_list_id, :integer
  end
end
