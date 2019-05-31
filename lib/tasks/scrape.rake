require_relative "../../app/jobs/launch_scraper_service_job"

namespace :scrape do
  desc "Scrape events and save them"
  task :events do
    LaunchScraperServiceJob.perform_later
  end
end
