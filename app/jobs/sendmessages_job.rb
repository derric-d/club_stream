class SendmessagesJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    events = Event.tags_for_user(user)
    message = <<~MESSAGE
🎊 Your *Clubster* selection for _next_ _days_ 🎉

✅ #{events.last.name} at #{events.last.club_name} on #{events.last.date.strftime("%a, %b %d, %I%P")}, #{events.last.link}

✅ #{events.last.name} at #{events.last.club_id} on #{events.last.date}, rebrand.ly/8ab6f

✅ #{events.last.name} at #{events.last.club_id} on #{events.last.date}, rebrand.ly/8ab6f

✅ #{events.last.name} at #{events.last.club_id} on #{events.last.date}, rebrand.ly/8ab6f

✅ #{events.last.name} at #{events.last.club_id} on #{events.last.date}, rebrand.ly/8ab6f

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
end
