class AddGoalIdToImmediateGoals < ActiveRecord::Migration[6.1]
  def change
    add_column :immediate_goals, :goal_id, :integer
  end
end
