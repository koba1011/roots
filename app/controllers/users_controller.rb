class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :following, :followers]
  before_action :set_user, only: [:show, :edit, :update, :following, :followers]
  
  def show
    @posts = @user.posts.order("created_at DESC")
  end

  def edit
    if @user.id != current_user.id
      redirect_to root_path
    end 
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def following
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @users = @user.followers
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:name, :user_name, :profile, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
