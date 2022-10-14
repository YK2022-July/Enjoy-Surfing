class Goal < ApplicationRecord
  belongs_to :end_user
  has_many   :immediate_goals, dependent: :destroy
  has_many   :today_goals, dependent: :destroy

  #関連付けモデルのデータ同時保存の定義
  accepts_nested_attributes_for :immediate_goals, allow_destroy: true
  accepts_nested_attributes_for :today_goals, allow_destroy: true
end
