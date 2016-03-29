class AddDescColumnToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :desc, :text
  end
end
