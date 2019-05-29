class SendmessagesJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    HTTP.post("https://gate.appworkx.de/ws/send.php?",
      :json => {
        :username => "whudemo1",
        :password => "KdqfQA",
        :sendType => "simple",
        :text => "#{Event.tagged_with([User.last.tag_list], any: true).last.name}",
        :msisdn => "#{user.phone}"
       })
  end
end
