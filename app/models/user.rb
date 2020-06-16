class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :username
  validates_uniqueness_of :username

  validates_presence_of :fullname

  has_many :opinions, foreign_key: 'authorid', class_name: 'Opinion'

  has_many :followers, foreign_key: :followedid, class_name: :Following
  has_many :follower_users, through: :followers

  has_many :followeds, foreign_key: :followerid, class_name: :Following
  has_many :followed_users, through: :followeds

  has_one_attached :photo
  has_one_attached :coverimage

  def whotofollows
    User.where("id NOT IN (#{(followed_users.pluck('id') << id).join(', ')})")
  end
end
