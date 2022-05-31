class WishlistController < ApplicationController
  def index
    @wishlists = Wishlist.where(user: current_user)
  end

  def create
    @wishlist = Wishlist.new
    @wishlist.user = current_user
    authorize @wishlist
  end

  def update
  end
end
