class Request < ApplicationRecord

    belongs_to :member, dependent: :destroy
    has_many :deposit_cat

    has_one_attached :image

end
