class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.text :name
      t.text :name_kana
      t.stringr :address
      t.time :opening_hours
      t.time :closing_hours
      t.text :holiday
      t.text :business_period
      t.text :comment
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
