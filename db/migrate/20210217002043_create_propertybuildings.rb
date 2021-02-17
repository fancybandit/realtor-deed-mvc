class CreatePropertybuildings < ActiveRecord::Migration
  def change
    create_table :propertybuildings do |t|
      t.references :property
      t.references :building

      t.timestamps null: false
    end
  end
end
