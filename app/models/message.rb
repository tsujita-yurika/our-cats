class Message < ApplicationRecord

  belongs_to :member
  belongs_to :room

  validates :body, presence: { message: "を入力してください" }, length: { maximum: 140, message: "は140文字以内で入力してください" }

end
