class Cat < ApplicationRecord

  has_one_attached :image

  belongs_to :member
  belongs_to :category
  has_many :deposit_cats, dependent: :destroy
  has_many :requests, through: :deposit_cats

  validates :name, presence: true
  validates :sex, presence: true
  validates :age, presence: true

  # 投稿写真
  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

  # 検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @cat = Cat.where("name LIKE?", "#{word}")
    else
      @cat = Cat.all
    end
  end

end
