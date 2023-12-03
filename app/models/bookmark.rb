class Bookmark < ApplicationRecord
  belongs_to :member
  belongs_to :request

  # 同じmemberが同じrequestに対して複数回ブックマークできないようにする
  validates :member_id, uniqueness: { scope: :request_id }
end
