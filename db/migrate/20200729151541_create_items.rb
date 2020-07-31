class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :introduction, null: false
      t.references :brand, foreign_key: true
      t.references :status, foreign_key: true
      t.references :postage_type, foreign_key: true
      t.references :prefecture, foreign_key: true
      t.references :need_day, foreign_key: true
      t.integer :seller_id, null: false
      t.integer :buyer_id
      t.timestamps
    end
  end
end
