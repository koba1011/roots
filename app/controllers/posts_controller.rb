class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search]
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all.order("created_at DESC")
    @random = Post.all.order("RAND()").limit(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    if @post.user_id != current_user.id
      redirect_to root_path
    end 
  end

  def update
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url
    if @post.update(post_params)
      redirect_to post_path method: :get
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id != current_user.id
      redirect_to root_path
    end
    post.destroy
    redirect_to root_path
  end

  def search
    @posts = Post.search(params[:keyword])
    @random = @posts.order("RAND()").limit(1)
  end

  def favorites
    @posts = current_user.favorite_posts.includes(:user).order("created_at DESC")
  end


  private

  def post_params
    params.require(:post).permit(:video, :caption, :describe, :place, :share_url).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
