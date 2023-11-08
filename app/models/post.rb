class Post < ApplicationRecord

  belongs_to :member
  has_many :likes

end
