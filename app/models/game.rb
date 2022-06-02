class Game < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  taggable_array :tags
end
