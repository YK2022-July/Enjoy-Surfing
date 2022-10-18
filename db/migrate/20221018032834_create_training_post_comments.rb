class CreateTrainingPostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :training_post_comments do |t|
      t.text :comment
      t.integer :end_user_id
      t.integer :training_post_id
      t.timestamps
    end
  end
end
