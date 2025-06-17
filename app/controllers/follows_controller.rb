class FollowsController < ApplicationController
  def change
    if params[:button]=="accept"
      follow=Follow.where(follower:User.find_by(email:params[:friend])).where(followed:User.find_by(email:params[:user])).take
      if follow.nil?
        
      elsif follow.status=="pending"
        follow.status="accepted"
        follow.save
      elsif follow.status=="accepted"
        follow.destroy
      end
    elsif params[:button]=="follow"
      follow=Follow.where(follower:User.find_by(email:params[:user])).where(followed:User.find_by(email:params[:friend])).take
      if follow.nil?
        Follow.create(follower:User.find_by(email:params[:user]),followed:User.find_by(email:params[:friend]),status:"pending")
      elsif follow.status=="pending"
        follow.destroy
      elsif follow.status=="accepted"
        follow.destroy
      end
    end
  end
end
