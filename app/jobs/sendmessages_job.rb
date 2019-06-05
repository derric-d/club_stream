class SendmessagesJob < ApplicationJob
  queue_as :default

  def perform
    # change date.today to tuesday for production
    if Date.today.wednesday?
      User.find_each do |user|
        new_message = CreateMessagesService.new
        new_message.create_message(user)
      end
    end
  end
end
