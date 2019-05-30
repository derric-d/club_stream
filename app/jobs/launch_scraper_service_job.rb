class LaunchScraperServiceJob < ApplicationJob
  queue_as :default

  def perform
    scraper_service = ResidentAdvisorScraperService.new
    scraper_service.find_events_with_mechanize
  end
end
