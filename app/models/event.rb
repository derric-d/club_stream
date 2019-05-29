class Event < ApplicationRecord
  belongs_to :club
  acts_as_taggable

  validates :name, :link, :date, presence: true

  # def event_params
  #   params.require(:event).permit(:name, :date, :description, :link, tag_list: []) ## Rails 4 strong params usage
  # end
end
