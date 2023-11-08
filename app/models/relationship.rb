class Relationship < ApplicationRecord

  belongs_to :follower, class_name: "Member"
  belongs_to :followed, class_name: "Member"
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

end
