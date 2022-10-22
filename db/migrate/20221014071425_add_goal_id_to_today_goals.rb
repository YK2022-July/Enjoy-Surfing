class AddGoalIdToTodayGoals < ActiveRecord::Migration[6.1]
  def change
    add_column :today_goals, :goal_id, :integer
  end
end
