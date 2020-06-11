class Following < ApplicationRecord
  belongs_to :followed_user, foreign_key: :followedid, class_name: :User
  belongs_to :follower_user, foreign_key: :followerid, class_name: :User
end
