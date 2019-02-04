class RemoveImagesFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :images, :json
  end
end
