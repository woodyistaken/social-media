# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do |index|
    user=User.create(email:"a#{index+1}@b",password:"123456")
end 
10.times do |index|
  user=User.find(index+1)
  user.posts.create(body:"I am a#{index+1}")
end 

User.find(2).followers.push(User.find(1))
follow=User.find(2).follower.where(follower:User.find(1)).take
follow.status="pending"
follow.save

User.find(1).followers.push(User.find(3))
follow=User.find(1).follower.where(follower:User.find(3)).take
follow.status="accepted"
follow.save

User.find(2).followings.push(User.find(1))
follow=User.find(2).following.where(followed:User.find(1)).take
follow.status=1
follow.save


