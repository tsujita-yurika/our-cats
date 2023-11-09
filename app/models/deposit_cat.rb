class DepositCat < ApplicationRecord

    belongs_to :request

    has_one_attached :image

end
