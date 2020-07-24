class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name_kana, :string, null: false
    add_column :users, :birth_year, :date, null: false
    add_column :users, :birth_month, :date, null: false
    add_column :users, :birth_day, :date, null: false
  end
end
