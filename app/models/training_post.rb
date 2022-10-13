class TrainingPost < ApplicationRecord

  belongs_to :end_user
  has_one_attached :post_image

  #投稿画像の取得メソッド
  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end

  #投稿の公開・非公開の条件
  scope :active, -> {where(is_active: true)}
  scope :inactive, -> {where(is_active: false)}
end
