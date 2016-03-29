class AddCmCandidateColumnToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :cm_candidate, :integer
  end
end
