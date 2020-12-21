class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :information_id,     null: false, foreign_key: true
      t.string  :post_num,           null: false, default: ""
      t.integer :pref_id,            null: false
      t.string  :city,               null: false, default: ""
      t.string  :house_num,          null: false, default: ""
      t.string  :building,           null: false, default: ""
      t.string  :tel,                null: false, default: ""
      t.timestamps
    end
  end
end
