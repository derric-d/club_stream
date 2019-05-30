namespace :scrape do
  desc "Scrape events and save them"
  task :events do
    user = User.first
    LaunchScraperServiceJob.perform_later(user.id)
  end
end
