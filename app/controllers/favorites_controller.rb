class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite

  def create
    favorite = current_user.favorites.build(post_id: @post.id)
    favorite.save
  end

  def destroy
    favorite = Favorite.find_by(post_id: @post.id, user_id: current_user.id)
    favorite.destroy
  end

  private

  def set_favorite
    @post = Post.find(params[:post_id])
  end
end
