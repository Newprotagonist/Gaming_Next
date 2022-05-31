class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    authorize @game
    @user = current_user
  end
end
