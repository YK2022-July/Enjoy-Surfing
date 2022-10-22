class AddLastSignInIpToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :last_sign_in_ip, :string
  end
end
