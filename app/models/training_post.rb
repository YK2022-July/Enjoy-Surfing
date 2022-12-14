class TrainingPost < ApplicationRecord

  belongs_to :end_user
  has_many   :today_goals, dependent: :destroy
  has_many   :training_tag_relations, dependent: :destroy
  has_many   :tags, through: :training_tag_relations, dependent: :destroy
  has_many   :fights, dependent: :destroy
  has_many   :training_post_comments, dependent: :destroy
  has_one_attached :post_image

  #投稿画像の取得メソッド
  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_post_image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end

  #投稿の公開・非公開の条件
  scope :active, -> {where(is_active: true)}
  scope :inactive, -> {where(is_active: false)}

  #リアクション機能
  def fight_pushed_by?(end_user)
    fights.exists?(end_user_id: end_user.id)
  end
end

