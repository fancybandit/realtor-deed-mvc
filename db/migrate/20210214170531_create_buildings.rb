class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.references :property
      t.integer :year_built
      t.float :price

      t.timestamps null: false
    end
  end
end
