class CreatePropertyBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :property_buildings do |t|
      t.references :property
      t.references :building

      t.timestamps null: false
    end
  end
end
