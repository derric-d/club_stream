class CreateMessagesService

  def create_message(user)
<<<<<<< HEAD
    events = Event.tags_for_user(user).limit(5)
    events.each do |event|
      if event.date > Date.today
        message = <<~MESSAGE
        🎧 Your *Clubster* selection for _next_ _days_ 🎧
=======
    events = Event.tags_for_user(user).limit(10)
    message = <<~MESSAGE
    🎧 Your *Clubster* selection for _next_ _days_ 🎧
>>>>>>> 0dab14f8b3ad4e145996e805f108ba67f712e323

    #{event_message_builder(events)}

    Change your preferences on www.clubster.io/preferences 🎧
    MESSAGE

    HTTP.post(
      "https://gate.appworkx.de/ws/send.php?",
      json: {
        username: ENV['WAUSERNAME'],
        password: ENV['WAPASSWORD'],
        sendType: "simple",
        # fileType: "image",
        # filename: "Clubster",
        # file: "clubster-logo.jpeg",
        text: message,
        msisdn: "#{user.phone}"
      }
      )
    Message.create(user_id: user.id, content: message)
    puts "#{message} sent to #{user.email}"
  end

  def event_message_builder(events)
    events.map do |event|
      if event.date > Date.today
        "✔️ *#{event.name}* at #{event.club_name} on #{event.date.strftime("%a, %b %d")}, #{event.shorturl}"
      end
    end.join("\n\n")
  end
end
