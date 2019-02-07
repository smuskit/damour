class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|

      t.integer :card_id
      t.string :dam_image
      t.timestamps
    end
  end
end
