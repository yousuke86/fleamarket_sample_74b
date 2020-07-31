class CreateNeedDays < ActiveRecord::Migration[5.2]
  def change
    create_table :need_days do |t|
      t.string :need_day, null: false
      t.timestamps
    end
  end
end
