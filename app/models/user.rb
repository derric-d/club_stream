class User < ApplicationRecord

  acts_as_taggable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :phone, presence: true
  after_update :async_update

  GENRES = %w[HipHop Techno Charts Pop 80ies 90ies Disco Afro Rock Reggae Classic Jazz]
  CLUBS = ["Berghain", "Kater Blau", "Sage club", "Kit Kat", "THE PEARL", "Insomnia", "Cassiopeia",
    "Astra Kulturhaus", "AVA Club", "Matrix", "Sage club", "PURO Sky Lounge",
    "Alte Kantine", "Frannz Club", "Pirates Berlin"]

  # def event_params
  #   params.require(:event).permit(:email, :phone, :city, tag_list: []) ## Rails 4 strong params usage
  # end

  private

  def async_update
    SendmessagesJob.perform_now(self.id)
  end
end
