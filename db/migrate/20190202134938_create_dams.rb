class CreateDams < ActiveRecord::Migration[5.2]
  def change
    create_table :dams do |t|
      t.integer :region_id
      t.integer :prefecture_id
      t.string :name
      t.string :name_kana
      t.string :address
      t.string :river
      t.integer :dam_type, limit: 1, default: 0, null: false
      t.string :gate
      t.float :height
      t.float :length
      t.float :volume
      t.text :purpose
      t.text :constructor
      t.text :start_of_construction
      t.text :end_of_construction
      t.string :dam_image_id
      t.timestamps
    end
  end
end
