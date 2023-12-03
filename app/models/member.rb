class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_one_attached :image
  # 猫
  has_many :cats, dependent: :destroy
  # チャット
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  # 依頼
  has_many :requests, dependent: :destroy
  # ブックマーク
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: true
  validates :sex, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :prefectures, presence: true

# 現在ログインしているmemberがrequestをブックマークしているかどうかを判定
  def bookmarked?(bookmark_request)
    bookmarks.exists?(request_id: bookmark_request.id)
  end

# ゲストログイン
GUEST_MEMBER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_MEMBER_EMAIL) do |member|
      member.password = SecureRandom.urlsafe_base64
      member.name = "guestmember"
      member.sex = "male"
      member.prefectures = "東京都"
      member.real_name = "guestreal_name"
      member.phone_number = "00000000011"
      member.address = "東京都新宿区0-0-0"
    end
  end

  def guest_member?
    email == GUEST_MEMBER_EMAIL
  end

  # プロフィールの写真
  def get_profile_image
    if profile_image.attached?
      profile_image
    else
      'no_image.jpg'
    end
  end

  # 本人確認書類の写真
  def get_image
     if image.attached?
       image
     else
       'no_image.jpg'
     end
  end

  #会員ステータス
  def member_status
    if is_active == false
      "退会"
    else
      "有効"
    end
  end

  #退会したら同じアカウントでログインできない
  def active_for_authentication?
     super && (is_active == true)
  end

end