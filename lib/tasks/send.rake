namespace :send do
  desc "Send messages to users"
  task messages: :environment do
    SendmessagesJob.perform_later
  end
end
