class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.integer :district_list_id
      t.text :name

      t.timestamps null: false
    end
  end
end
