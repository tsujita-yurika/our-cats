class Request < ApplicationRecord

    belongs_to :member
    has_many :deposit_cats, dependent: :destroy

    accepts_nested_attributes_for :deposit_cats, allow_destroy: true, reject_if: :all_blank

    has_one_attached :image

end
