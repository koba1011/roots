class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all.order("created_at DESC")
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

  private

  def post_params
    params.require(:post).permit(:video, :caption, :describe, :place, :share_url).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
