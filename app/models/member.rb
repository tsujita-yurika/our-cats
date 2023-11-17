class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cats, dependent: :destroy

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :posts
  has_many :likes

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id"
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id"
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :requests, dependent: :destroy

  has_one_attached :profile_image
  has_one_attached :image

  validates :name, presence: true
  validates :sex, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :prefectures, presence: true


GUEST_MEMBER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_MEMBER_EMAIL) do |member|
      member.password = SecureRandom.urlsafe_base64
      member.name = "guestmember"
      member.sex = "male"
      member.prefectures = "東京"
      member.real_name = "guestreal_name"
      member.phone_number = "00000000011"
      member.address = "東京都新宿区0-0-0"
    end
  end

  def guest_member?
    email == GUEST_MEMBER_EMAIL
  end

  def get_profile_image
    if profile_image.attached?
      profile_image
    else
      'no_image.jpg'
    end
  end

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

   def active_for_authentication?
     super && (is_active == true)
   end

end