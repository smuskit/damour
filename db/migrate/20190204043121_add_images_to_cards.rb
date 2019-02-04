class AddImagesToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :images, :json
  end
end
