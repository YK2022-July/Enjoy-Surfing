class AddTrainingPostIdToFights < ActiveRecord::Migration[6.1]
  def change
    add_column :fights, :training_post_id, :integer
  end
end
