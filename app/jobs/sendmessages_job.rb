class SendmessagesJob < ApplicationJob
  queue_as :default

  def perform
    # change date.today to tuesday for Production
    if Date.today.friday?
      User.find_each do |user|
        new_message = CreateMessagesService.new
        new_message.create_message(user)
      end
    end
  end
end
