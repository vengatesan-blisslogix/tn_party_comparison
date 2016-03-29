class CreatePartyLists < ActiveRecord::Migration
  def change
    create_table :party_lists do |t|
      t.string :name
      t.text :image
      t.text :comments

      t.timestamps null: false
    end
  end
end
