class AddAreaIdColumnToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :area_id, :integer
    add_column :votes, :party_list_id, :integer
  end
end
