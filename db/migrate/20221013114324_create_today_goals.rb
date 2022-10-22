class CreateTodayGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :today_goals do |t|

      t.integer :end_user_id
      t.integer :training_post_id
      t.string  :goal1
      t.string  :goal2
      t.string  :goal3
      t.timestamps
    end
  end
end
