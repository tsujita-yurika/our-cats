class Cat < ApplicationRecord

  belongs_to :member
  belongs_to :category
  has_many :deposit_cats, dependent: :destroy
  has_many :requests, through: :deposit_cats

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

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @cat = Cat.where("name LIKE?", "#{word}")
    else
      @cat = Cat.all
    end
  end

end
