class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence:true
  has_many :likes
  has_many :likers, through: :likes, class_name: :User
  has_many :comments
  has_many :commenters, through: :comments, class_name: :User
end
