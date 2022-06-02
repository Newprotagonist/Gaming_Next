class SuggestionsController < ApplicationController
  def index
    skip_policy_scope
    @suggestions = Game.where(id: 390)
    @favorites = Favorite.all.where(user: current_user)
    @games_id = @favorites.map { |favorite| favorite.game_id }
    @tags = (@games_id.map { |game_id| Game.find(game_id).tags }).flatten
    @suggestions = Game.where("tags @> ARRAY[?]::varchar[]", ['fantasy' || 'rpg' || 'adventure'])
  end
end
