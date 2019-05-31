namespace :scrape do
  desc "Scrape events and save them"
  task :events do
    Rails.application.eager_load!
    LaunchScraperServiceJob.perform_later
  end
end
