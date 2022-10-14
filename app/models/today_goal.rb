class TodayGoal < ApplicationRecord
  belongs_to :end_user, optional: true
  belongs_to :training_post, optional: true
  belongs_to :goal, optional: true
  belongs_to :immediate_goal, optional: true
end
