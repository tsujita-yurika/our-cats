class Request < ApplicationRecord

    has_one :member, dependent: :destroy

end
