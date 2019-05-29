class User < ApplicationRecord

  acts_as_taggable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :phone, uniqueness: true

  GENRES = %w[house hip-hop techno mainstream classic]

  # def event_params
  #   params.require(:event).permit(:email, :phone, :city, tag_list: []) ## Rails 4 strong params usage
  # end
end
