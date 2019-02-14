class CreateDamComments < ActiveRecord::Migration[5.2]
  def change
    create_table :dam_comments do |t|
      t.integer :user_id
      t.integer :dam_id
      t.text :comment
      t.string :comment_image_id

      t.timestamps
    end
  end
end
