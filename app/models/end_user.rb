class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :training_posts, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :immediate_goals, dependent: :destroy
  has_many :today_goals, dependent: :destroy
  has_many :fights, dependent: :destroy
  has_many :training_post_comments, dependent: :destroy
  has_one_attached :user_image

  #プロフィール画像の取得メソッド
  def get_user_image(width, height)
    unless user_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      user_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    user_image.variant(resize_to_limit: [width, height]).processed
  end

  #ゲストログイン機能のメソッド
  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |end_user|
      end_user.password = SecureRandom.urlsafe_base64
      end_user.name = "ゲスト"
    end
  end

  #ログイン時の退会ステータスの判定メソッド
  def active_for_authentication?
    super && (is_deleted == false)
  end

  #ユーザーの利用停止・再開の条件（管理者）
  scope :suspend, -> {where(is_suspended: true)}
  scope :resume, -> {where(is_suspended: false)}
end
