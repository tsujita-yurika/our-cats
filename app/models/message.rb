class Message < ApplicationRecord

  belongs_to :member
  belongs_to :room

  validates :body, presence: true, length: { maximum: 140 }

end
