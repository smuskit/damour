class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :address
      t.text :opening_hours
      t.text :comment
      t.decimal :latitude,  precision: 11, scale: 8
      t.decimal :longitude,  precision: 11, scale: 8
      t.timestamps
    end
  end
end
