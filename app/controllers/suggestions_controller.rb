class SuggestionsController < ApplicationController
  def index
    skip_policy_scope
    tags = current_user.favorites.map(&:game).pluck(:tags).flatten
    @suggestions = []
    @suggestions = Game.with_any_tags(tags).to_a
    current_user.favorites.map(&:game).each { |game| @suggestions.delete(game) }
    # @suggestions = @suggestions.flatten.uniq.select do |suggestion|
    #   (suggestion.tags & tags).size > suggestion.tags.size / 1.5
    # end
    @suggestions = @suggestions.sort_by { |game| -(game.tags & tags).size.fdiv((game.tags + tags).uniq.size) }.first(20)
  end
end
