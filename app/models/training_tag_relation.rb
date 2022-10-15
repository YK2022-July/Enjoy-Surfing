class TrainingTagRelation < ApplicationRecord
  belongs_to :training_post
  belongs_to :tag
end
