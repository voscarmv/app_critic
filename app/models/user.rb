class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followers, foreign_key: :followedid, class_name: :Following
  has_many :follower_users, through: :followers

  has_many :followeds, foreign_key: :followerid, class_name: :Following
  has_many :followed_users, through: :followeds

  has_one_attached :photo
  has_one_attached :coverimage
end
