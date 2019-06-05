class CreateMessagesService

  def create_message(user)
    events = Event.tags_for_user(user).limit(10)
    events.each do |event|
      if event.date > Date.today
        message = <<~MESSAGE
        🎧 Your *Clubster* selection for _next_ _days_ 🎧

        #{event_message_builder(events)}

        Change your preferences on www.clubster.io/preferences 🎧
        MESSAGE

        HTTP.post(
          "https://gate.appworkx.de/ws/send.php?",
          json: {
            username: ENV['WAUSERNAME'],
            password: ENV['WAPASSWORD'],
            sendType: "simple",
            filename: "https://source.unsplash.com/random(800x800)",
            # type: "image",
            text: message,
            msisdn: "#{user.phone}"
          }
        )
        Message.create(user: user, content: message)
      end
    end
  end

     def event_message_builder(events)
       events.map do |event|
         "✔️ *#{event.name}* at #{event.club_name} on #{event.date.strftime("%a, %b %d")}, #{event.shorturl}"
       end.join("\n\n")
     end
end
