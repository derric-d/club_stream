class SendmessagesJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    HTTP.post("https://gate.appworkx.de/ws/send.php?",
      :json => {
        :username => "whudemo1",
        :password => "KdqfQA",
        :sendType => "simple",
        :text => "🎊 Your *Clubster* selection for _next_ _weekend_🎉

✅ #{Event.tagged_with([User.last.tag_list], any: true).last.name} at #{Event.tagged_with([User.last.tag_list], any: true).last.club_id} on #{Event.tagged_with([User.last.tag_list], any: true).last.date}, rebrand.ly/8ab6f

✅ #{Event.tagged_with([User.last.tag_list], any: true).last.name} at #{Event.tagged_with([User.last.tag_list], any: true).last.club_id} on #{Event.tagged_with([User.last.tag_list], any: true).last.date}, rebrand.ly/8ab6f

✅ #{Event.tagged_with([User.last.tag_list], any: true).last.name} at #{Event.tagged_with([User.last.tag_list], any: true).last.club_id} on #{Event.tagged_with([User.last.tag_list], any: true).last.date}, rebrand.ly/8ab6f

✅ #{Event.tagged_with([User.last.tag_list], any: true).last.name} at #{Event.tagged_with([User.last.tag_list], any: true).last.club_id} on #{Event.tagged_with([User.last.tag_list], any: true).last.date}, rebrand.ly/8ab6f

✅ #{Event.tagged_with([User.last.tag_list], any: true).last.name} at #{Event.tagged_with([User.last.tag_list], any: true).last.club_id} on #{Event.tagged_with([User.last.tag_list], any: true).last.date}, rebrand.ly/8ab6f

🎧 Enjoy your parties 🎶",
        :msisdn => "#{user.phone}"
       })
  end
end
