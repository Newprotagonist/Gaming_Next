class Game < ApplicationRecord
  has_many :favorites
  has_many :wishlists
end
