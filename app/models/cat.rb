class Cat < ApplicationRecord

  belongs_to :member
  has_many :deposit_cats, dependent: :destroy

  has_one_attached :image

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

end
