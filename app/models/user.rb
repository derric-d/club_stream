class User < ApplicationRecord

  acts_as_taggable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :phone, presence: true, format: { with: /^[^0+]\d*/, :multiline => true, message: "number not valid; see placeholder" }
  validates :terms_accepted, acceptance: { message: 'is required' }
  validates :email, presence: true, format: { with: /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/, :multiline => true, message: "not valid"}
  # after_update :async_update

  GENRES = %w[HipHop Techno Charts Pop 80ies 90ies Disco Afro Rock Reggae Classic Jazz]
  CLUBS = ["Berghain", "Kater Blau", "Sisyphos", "KitKat", "Watergate", "Ritter Butzke", "GoldenGate", "Insomnia", "Cassiopeia",
    "Astra Kulturhaus", "Tresor", "Matrix", "Sage club", "Bricks", "PrinceCharles", "Else", "Club der Visionäre", "Birgit&Bier", "Arena",
    "Alte Kantine", "Frannz Club", "Avenue", "Magdalena", "Pearl", "Wilde Renate", "Burg Schnabel", "808", "Bohnengold", "Farbfernseher", "KittyCheng", "//about:blank", "Rummelsburg", "Suicide Circus"]

  # def event_params
  #   params.require(:event).permit(:email, :phone, :city, tag_list: []) ## Rails 4 strong params usage
  # end

  private

  def async_update
    SendmessagesJob.perform_now(self.id)
  end
end
