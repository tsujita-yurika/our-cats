class Cat < ApplicationRecord

  belongs_to :member
  belongs_to :category
  has_many :deposit_cats, dependent: :destroy
  has_many :requests, through: :deposit_cats
  # has_many :categories, dependent: :destroy

  validates :name, presence: true
  validates :sex, presence: true
  validates :age, presence: true

  has_one_attached :image

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

end
