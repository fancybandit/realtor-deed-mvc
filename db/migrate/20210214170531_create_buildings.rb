class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.integer :year_built
      t.integer :price, default: 0
      t.references :property, foreign_key: {on_delete: :cascade}

      t.timestamps null: false
    end
  end
end
