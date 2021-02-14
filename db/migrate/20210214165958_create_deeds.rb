class CreateDeeds < ActiveRecord::Migration
  def change
    create_table :deeds do |t|
      t.references :owner
      t.references :property
      t.string :owner_name
      t.date :date_signed

      t.timestamps null: false
    end
  end
end
