class Request < ApplicationRecord

    belongs_to :member
    has_many :deposit_cats, dependent: :destroy
    has_many :cats, through: :deposit_cats
    has_many :entries

    has_one_attached :image

    validates :cats, presence: { message: "少なくとも1匹の猫を選択してください" }
    validates :season, presence: true
    validates :days, presence: true
    validates :location, presence: true

end
