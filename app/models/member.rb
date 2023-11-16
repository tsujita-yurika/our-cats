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

  validates :name, presence: true
  validates :sex, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :prefectures, presence: true

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
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