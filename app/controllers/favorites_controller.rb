class FavoritesController < ApplicationController
  def index
    @favorites = policy_scope(Favorite)
    @favorite = Favorite.new
    @games = []

    if params[:query].present?
      @games = Game.where('name ILIKE?', "%#{params[:query]}%").first(20)
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "list", locals: { games: @games }, formats: [:html] }
    end
  end

  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.game_id = params[:game_id]
    authorize @favorite
    if @favorite.save
      redirect_to favorites_path
    else
      render favorites_path
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

  def destroy
    @favorite = Favorite.find(params[:id])
    authorize @favorite
    @favorite.destroy
    redirect_to favorites_path, status: :see_other
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :game_id)
  end
end
