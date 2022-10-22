class AddCurrentSignInIpToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :current_sign_in_ip, :string
  end
end
