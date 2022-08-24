class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # splitメソッドとは文字列を分割して配列にするメソッド
    # 受け取った値を「,」で区切って配列にする
    tag_list = params[:post][:name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id), notice: '投稿完了しました'
    else
      render :new
    end
  end

  def index
    @tag_lists = Tag.all
    
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.all
    else
      @posts = Post.all
    end

  end

  def show
  end

  def search
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:body, :image, :name, :tag_id)
  end

end
