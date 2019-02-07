class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.text :name
      t.text :name_kana
      t.text :address
      t.time :opening_hours
      t.time :closing_hours
      t.text :holiday
      t.text :business_period
      t.text :comment
      t.decimal :latitude,  precision: 11, scale: 8
      t.decimal :longitude,  precision: 11, scale: 8
      t.timestamps
    end
  end
end
