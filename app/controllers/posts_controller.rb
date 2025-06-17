class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    all_post=Post.all
    @posts=all_post.filter do |post|
      current_user.followings.include?(post.user) && current_user.following.where(followed:post.user).take.status=='accepted' || post.user==current_user
    end
  end
  def show
    @post=Post.find(params[:id])
  end
  def new
    @post=Post.new
  end
  def create
    @post=current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end
  def add_like
    current_user.likes.create(post:Post.find(params[:id]))
    redirect_to Post.find(params[:id])
  end
  def delete_like
    current_user.likes.where(post:Post.find(params[:id])).destroy_all
    redirect_to Post.find(params[:id])
  end
 private
 def post_params
   params.expect(post:[:body])
 end
end
