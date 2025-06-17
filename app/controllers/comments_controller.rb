class CommentsController < ApplicationController
  def create
    current_user.comments.create(body:comment_params[:body],post:Post.find(comment_params[:post_id]))
    redirect_to Post.find(comment_params[:post_id])
  end 
  private
  def comment_params
    params.expect(comment:[:body,:post_id])
  end
end
