class CreateSendingDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :sending_destinations do |t|
      t.string :destination_last_name ,null:false
      t.string :destination_first_name ,null:false
      t.string :destination_last_name_kana ,null:false
      t.string :destination_first_name_kana ,null:false
      t.string :post_code ,null:false
      t.references :prefecture, foreign_key: true ,null:false
      t.string :city ,null:false
      t.string :house_number ,null:false
      t.string :buildingname_and_roomnumber
      t.string :tel
      t.references :user ,foreign_key:true,null:false
      t.timestamps
    end
  end
end
