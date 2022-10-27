class AddTypeNameToEndUser < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :type_name, :string
  end
end
