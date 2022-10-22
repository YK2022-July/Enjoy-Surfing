class AddCurrentSignInAtToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :current_sign_in_at, :datetime
  end
end
