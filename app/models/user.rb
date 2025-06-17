class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, class_name: :Post,source: :user
  has_many :comments
  has_many :commented_posts, through: :comments, class_name: :Post,source: :user
  has_many :follower, foreign_key: "followed_id", class_name: :Follow
  has_many :followers, through: :follower, class_name: :User,source: :follower
  has_many :following, foreign_key: "follower_id", class_name: :Follow
  has_many :followings, through: :following, class_name: :User,source: :followed
  
end
