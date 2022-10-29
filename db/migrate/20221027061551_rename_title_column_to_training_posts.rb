class RenameTitleColumnToTrainingPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :training_posts, :title, :area
  end
end
