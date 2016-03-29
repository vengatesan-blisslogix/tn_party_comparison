class AddLeadingCountColumnToPartyLists < ActiveRecord::Migration
  def change
    add_column :party_lists, :leading_count, :bigint
  end
end
