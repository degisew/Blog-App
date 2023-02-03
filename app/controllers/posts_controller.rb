class PostsController < ApplicationController
  def index
    @posts = User.includes(:posts)
    @user = User.find_by(id: params[:user_id])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
  end
end
