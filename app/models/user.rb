class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :wishlists
  has_many :favorites

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, format: { with: /\A\w+\z/, message: "only allows letters, numbers and _" }
end
