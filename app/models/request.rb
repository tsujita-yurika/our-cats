class Request < ApplicationRecord

    belongs_to :member
    has_many :deposit_cats, dependent: :destroy
    has_many :cats, through: :deposit_cats
    has_many :entries, dependent: :destroy

    has_one_attached :image

    validates :season, presence: true
    validates :days, presence: true
    validates :location, presence: true
    validate :at_least_one_cat_selected

    def at_least_one_cat_selected
        errors.add(:cat_ids, "は１つ以上選択してください") if cat_ids.blank?
    end

end
