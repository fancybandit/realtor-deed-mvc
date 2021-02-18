class CreateBuildingProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :building_properties do |t|
      t.references :building
      t.references :property

      t.timestamps null: false
    end
  end
end
