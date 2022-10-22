class CreateTrainingTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :training_tag_relations do |t|
      t.references :training_post, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
