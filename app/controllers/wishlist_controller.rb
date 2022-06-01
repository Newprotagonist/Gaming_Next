class WishlistController < ApplicationController
  def index
    @wishlists = policy_scope(Wishlist).where(user: current_user)
  end

  def create
    @wishlist = Wishlist.new
    @wishlist.user = current_user
    authorize @wishlist
    if @wislist.save
      redirect_to wishlists_path
    end
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    authorize @wishlist
    @wishlist.destroy
  end
end
