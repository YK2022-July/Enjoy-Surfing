class CreateImmediateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :immediate_goals do |t|

      t.integer :end_user_id
      t.string  :goal1
      t.string  :goal2
      t.timestamps
    end
  end
end
