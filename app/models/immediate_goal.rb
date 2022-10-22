class ImmediateGoal < ApplicationRecord
  belongs_to :end_user, optional: true
  belongs_to :goal, optional: true
  has_many  :today_goals, dependent: :destroy
end
