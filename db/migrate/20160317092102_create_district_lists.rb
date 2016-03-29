class CreateDistrictLists < ActiveRecord::Migration
  def change
    create_table :district_lists do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
