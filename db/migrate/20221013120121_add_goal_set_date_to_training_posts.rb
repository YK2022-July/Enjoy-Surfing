class AddGoalSetDateToTrainingPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :training_posts, :goal_set_date, :date
  end
end
