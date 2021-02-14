class CreateDeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :deeds do |t|
      t.references :owner, foreign_key: {to_table: :users, on_delete: :cascade}
      t.references :property
      t.string :owner_name
      t.date :date_signed

      t.timestamps null: false
    end
  end
end
