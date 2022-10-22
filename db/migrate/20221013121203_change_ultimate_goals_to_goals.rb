class ChangeUltimateGoalsToGoals < ActiveRecord::Migration[6.1]
  def change
    rename_table :ultimate_goals, :goals
  end
end
