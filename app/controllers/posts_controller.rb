class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @posts = Post.all.order(created_at: :desc)
    if !user_signed_in?
      
    end
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
