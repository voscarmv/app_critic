class Following < ApplicationRecord
  include ActiveModel::Validations

  validates :followedid, uniqueness: { scope: :followerid }
  validates :followedid, presence: true
  validates :followedid, presence: true
  validates_with FollowingValidation

  belongs_to :followed_user, foreign_key: :followedid, class_name: :User
  belongs_to :follower_user, foreign_key: :followerid, class_name: :User
end
