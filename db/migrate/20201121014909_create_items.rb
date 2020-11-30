class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id,      null: false, foreign_key: true
      t.string  :item_name,    null: false
      t.text    :detail,       null: false
      t.integer :category_id,  null: false
      t.integer :condition_id, null: false
      t.integer :ship_cost_id, null: false
      t.integer :ship_pref_id, null: false
      t.integer :ship_day_id,  null: false
      t.integer :price,        null: false
      t.timestamps
    end
  end
end
