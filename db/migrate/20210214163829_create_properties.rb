class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :address
      t.float :price
      t.integer :year_sold
      t.float :acreage

      t.timestamps null: false
    end
  end
end
