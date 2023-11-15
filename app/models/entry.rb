class Entry < ApplicationRecord

  belongs_to :member
  belongs_to :room
  belongs_to :request

end
