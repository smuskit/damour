class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :user_id
      t.integer :area_id
      t.integer :pref_id
      t.string :dam_name
      t.date :visit_date
      t.integer :version_bf
      t.integer :version_af
      t.integer :version_y
      t.integer :version_m
      t.timestamps
    end
  end
end
