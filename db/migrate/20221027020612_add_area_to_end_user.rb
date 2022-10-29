class AddAreaToEndUser < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :area, :string
  end
end
