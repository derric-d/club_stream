class SendmessagesJob < ApplicationJob
  queue_as :default

  def perform
    if Date.today.tuesday?
      User.all.each do |user|
        new_message = CreateMessagesService.new
        new_message.create_message(user)
      end
    end
  end
end
