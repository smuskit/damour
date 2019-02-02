class CreateDistributes < ActiveRecord::Migration[5.2]
  def change
    create_table :distributes do |t|
      t.integer :dam_id
      t.integer :facility_id
      t.timestamps
    end
  end
end
