class WishlistsController < ApplicationController
  def index
    @wishlists = policy_scope(Wishlist)
    @i = 0
  end

  def create
    @wishlist = Wishlist.new
    @wishlist.user = current_user
    @wishlist.game = Game.find(params[:game_id])
    authorize @wishlist
    if @wishlist.save
      redirect_to wishlists_path
    end
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    authorize @wishlist
    @wishlist.destroy
    redirect_to wishlists_path, status: :see_other
  end
end
