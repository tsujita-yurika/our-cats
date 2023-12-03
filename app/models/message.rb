class Message < ApplicationRecord

  belongs_to :member
  belongs_to :room

  # 入力必須かつ140字以内
  validates :body, presence: true, length: { maximum: 140 }
end
