class User < ApplicationRecord

  acts_as_taggable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :phone, uniqueness: true

  GENRES = %w[HipHop Techno Charts Pop 80ies 90ies Disco Afro Rock Reggae Classic Jazz]
  CLUBS = %w[berghain katerblau]
end
