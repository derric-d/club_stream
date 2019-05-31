class SendmessagesJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    events = Event.tags_for_user(user).limit(5)
    message = <<~MESSAGE
🎊 Your *Clubster* selection for _next_ _days_ 🎉
  #{event_message_builder(events)}
🎧 Change your preferences on clubster.io/preferences 🎶
    MESSAGE

    HTTP.post(
      "https://gate.appworkx.de/ws/send.php?",
      json: {
        username: ENV['WAUSERNAME'],
        password: ENV['WAPASSWORD'],
        sendType: "simple",
        text: message,
        msisdn: "#{user.phone}"
      }
    )
  end

  def event_message_builder(events)
    events.map do |event|
      "✅ #{event.name} at #{event.club_name} on #{event.date.strftime("%a, %b %d, %I%P")}, #{event.link}"
    end
  end
end
