class AddColumnsToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :area_id, :string
    add_column :end_users, :type_id, :string
    add_column :end_users, :name, :string, null: false, default: "ユーザー"
    add_column :end_users, :age, :string
    add_column :end_users, :sex, :string
    add_column :end_users, :home, :string
    add_column :end_users, :stance, :string
    add_column :end_users, :history, :string
    add_column :end_users, :introduction, :text
    add_column :end_users, :is_deleted, :boolean, null: false, default: false
  end
end
