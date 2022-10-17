class AddEndUserIdToFights < ActiveRecord::Migration[6.1]
  def change
    add_column :fights, :end_user_id, :integer
  end
end
