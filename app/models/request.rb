class Request < ApplicationRecord

    belongs_to :member
    has_many :deposit_cats, dependent: :destroy
    has_many :cats, through: :deposit_cats

    has_one_attached :image

end
