namespace :scrape do
  desc "Scrape events and save them"
  task :events  => :environment do
    LaunchScraperServiceJob.perform_now
  end
end
