class LaunchScraperServiceJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    scraper_service = ResidentAdvisorScraperService.new(user)
    scraper_service.find_events_with_mechanize
  end
end
