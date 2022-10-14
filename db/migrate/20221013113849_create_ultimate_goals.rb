class CreateUltimateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :ultimate_goals do |t|

      t.integer :end_user_id
      t.string  :goal
      t.timestamps
    end
  end
end
