class CreatelinksJob < ApplicationJob
  queue_as :default

  def perform(event_id)
    event = Event.find(event_id)
    ShortenerService.new(event).call
  end
end
