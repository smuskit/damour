class CreateDams < ActiveRecord::Migration[5.2]
  def change
    create_table :dams do |t|
      t.integer :region_id
      t.integer :pref_id
      t.string :name
      t.string :name_kana
      t.string :river
      t.integer :type
      t.string :gate
      t.integer :height
      t.integer :length
      t.integer :volume
      t.text :purpose
      t.text :constructor
      t.integer :start_of_construction
      t.integer :end_of_construction
      t.text :dam_image_id
      t.timestamps
    end
  end
end
