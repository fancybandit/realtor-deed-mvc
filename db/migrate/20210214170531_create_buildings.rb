class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.integer :year_built
      t.float :price, default: 0

      t.timestamps null: false
    end
  end
end
