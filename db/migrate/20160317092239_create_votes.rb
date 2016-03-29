class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :candidate_id
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
