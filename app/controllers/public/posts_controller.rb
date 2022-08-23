class Public::PostsController < ApplicationController
  def new
    @posts = Post.new
  end

  def create
    @posts = Post.new(post_params)
    @posts.user_id = current_user.id
    @posts.save
    redirect_to post_path(@post.id)
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:body,:image)
  end

end
