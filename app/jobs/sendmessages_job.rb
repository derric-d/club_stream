class SendmessagesJob < ApplicationJob
  queue_as :default

  def perform()
    HTTP.post("https://gate.appworkx.de/ws/send.php?",
      :json => {
        :username => "whudemo1",
        :password => "KdqfQA",
        :sendType => "simple",
        :text => "Test 123",
        :msisdn => "491738594856"
       })
  end
end
