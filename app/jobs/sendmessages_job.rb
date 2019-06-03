class SendmessagesJob < ApplicationJob
  queue_as :default

  def perform
    User.each do |user|
      new_message = CreateMessagesService.new
      new_message.create_message(user_id)
      new_message.event_message_builder(events)
    end
  end
end
