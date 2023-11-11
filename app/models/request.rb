class Request < ApplicationRecord

    belongs_to :member, dependent: :destroy
    has_many :deposit_cat

    has_one_attached :image

    enum location: { home: "自宅に来てもらう", deposit: "相手に預かってもらう" }

end
