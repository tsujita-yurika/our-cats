class Request < ApplicationRecord

    has_one_attached :image

    belongs_to :member # 〇request.member, ★request.member_id
    has_many :deposit_cats, dependent: :destroy
    has_many :cats, through: :deposit_cats # 〇request.cats, ★request.cats_id
    # 複数のエントリーを持つ（依頼受けたい人）
    has_many :entries, dependent: :destroy
    # ブックマーク
    has_many :bookmarks, dependent: :destroy

    validates :season, presence: true
    validates :days, numericality: { only_integer: true, other_than: 0 }
    validates :location, presence: true
    validate :at_least_one_cat_selected

    # 依頼時は猫を1匹以上チェックしてもらう
    def at_least_one_cat_selected
        errors.add(:cat_ids, "は１匹以上選択してください") if cat_ids.blank?
    end

end
