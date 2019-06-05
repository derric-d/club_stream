class CreateMessagesService

  def create_message(user)
    events = Event.tags_for_user(user).limit(5)
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
            sendType: "image",
            fileType: "image",
            filename: "Clubster",
            file: "clubster-logo.jpeg",
            text: message,
            msisdn: "#{user.phone}"
          }
        )
        Message.create(user_id: user_id, content: message)
        Message.save!
      end
    end
  end

     def event_message_builder(events)
       events.map do |event|
         "✔️ *#{event.name}* at #{event.club_name} on #{event.date.strftime("%a, %b %d")}, #{event.shorturl}"
       end.join("\n\n")
     end
end
