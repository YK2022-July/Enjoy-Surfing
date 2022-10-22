class AddSignInCountToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :sign_in_count, :integer
  end
end
