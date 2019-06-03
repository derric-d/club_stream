class Event < ApplicationRecord
  belongs_to :club
  acts_as_taggable

  validates :name, :link, :date, presence: true

  after_create :populate_tags
  after_create :create_shorturls
  # after_create :resident_advisor_scraper

  # def ResidentAdvisorScraperService
  #   ResidentAdvisorScraperService.new(self).call
  # end

  def self.tags_for_user(user)
    tagged_with([user.tag_list], any: true)
  end

  def populate_tags
    PopulateTagsService.new(self).call
  end

  def create_shorturls
    CreatelinksJob.perform_now
  end
  # def event_params
  #   params.require(:event).permit(:name, :date, :description, :link, tag_list: []) ## Rails 4 strong params usage
  # end
end
