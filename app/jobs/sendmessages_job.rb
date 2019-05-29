class SendmessagesJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    HTTP.post("https://gate.appworkx.de/ws/send.php?",
      :json => {
        :username => "whudemo1",
        :password => "KdqfQA",
        :sendType => "simple",
        :text => "🎊 Your <strong>Clubster</strong> selection 🎉 <br> ✅#{Event.tagged_with([User.last.tag_list], any: true).last.name} at #{Event.tagged_with([User.last.tag_list], any: true).last.club} on #{Event.tagged_with([User.last.tag_list], any: true).last.date}, #{Event.tagged_with([User.last.tag_list], any: true).last.url} <br> ✅#{Event.tagged_with([User.first.tag_list], any: true).first.name} at #{Event.tagged_with([User.first.tag_list], any: true).first.club} on #{Event.tagged_with([User.first.tag_list], any: true).first.date}, #{Event.tagged_with([User.first.tag_list], any: true).first.url}  🎧Enjoy your parties🎶",
        :msisdn => "#{user.phone}"
       })
  end
end
