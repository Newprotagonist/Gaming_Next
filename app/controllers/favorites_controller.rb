class FavoritesController < ApplicationController
  def index
    @favorites = policy_scope(Favorite)
  end

  def create
    @favorite = Favorite.new
    authorize @favorite
    if @favorite.save(favorite_params)
      redirect_to favorite_path
    else
      render favorite_path
    end
  end

  def update
    @favorite = Favorite.find(params[:id])
    authorize @favorite
    if @favorite.update
      redirect_to favorite_path
    else
      render favorite_path
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :game_id)
  end
end
