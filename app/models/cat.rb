class Cat < ApplicationRecord

  belongs_to :member

  has_one_attached :image

end
