class CreateTrainingPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :training_posts do |t|
      t.integer :end_user_id
      t.integer :comment_id
      t.integer :fight_id
      t.string :title
      t.text :body
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :round
      t.string :point
      t.string :weather
      t.string :wind
      t.string :condition
      t.string :size
      t.string :people
      t.string :board
      t.string :wetsuit
      t.integer :take_off
      t.string :goal
      t.boolean :is_active
      t.timestamps
    end
  end
end
