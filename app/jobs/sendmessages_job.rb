class SendmessagesJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    events = Event.tags_for_user(user)
    message = <<~MESSAGE
🎊 Your *Clubster* selection for _next_ _days_ 🎉

✅ #{events[0].name} at #{events[0].club_name} on #{events[0].date.strftime("%a, %b %d, %I%P")}, #{events[0].link}

✅ #{events[1].name} at #{events[1].club_name} on #{events[1].date.strftime("%a, %b %d, %I%P")}, #{events[1].link}

✅ #{events[2].name} at #{events[2].club_name} on #{events[2].date.strftime("%a, %b %d, %I%P")}, #{events[2].link}

✅ #{events[3].name} at #{events[3].club_name} on #{events[3].date.strftime("%a, %b %d, %I%P")}, #{events[3].link}

✅ #{events[4].name} at #{events[4].club_name} on #{events[4].date.strftime("%a, %b %d, %I%P")}, #{events[4].link}

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
