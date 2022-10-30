class RenameEncryptedPasswordColumnToAdmins < ActiveRecord::Migration[6.1]
  def change
    rename_column :admins, :encrypted_password, :password
  end
end
