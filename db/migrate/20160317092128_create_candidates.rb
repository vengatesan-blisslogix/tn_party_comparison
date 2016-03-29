class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.integer :area_id
      t.integer :party_list_id
      t.text :name
      t.text :image
      t.text :x1
      t.text :x2
      t.text :x3
      t.text :x4
      t.text :x5
      t.text :x6
      t.text :x7
      t.text :x8
      t.text :x9
      t.text :x10
      t.text :x11
      t.text :x12
      t.text :x13
      t.text :x14
      t.text :x15
           
      t.timestamps null: false
    end
  end
end
