class AddIsSuspendedToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :is_suspended, :boolean, null: false, default: false
  end
end
