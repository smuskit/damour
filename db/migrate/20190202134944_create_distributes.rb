class CreateDistributes < ActiveRecord::Migration[5.2]
  def change
    create_table :distributes do |t|
      t.text :dam_id
      t.text :facility_id
      t.timestamps
    end
  end
end
