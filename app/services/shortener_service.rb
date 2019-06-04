class ShortenerService
  def initialize(event)
    @event = event
  end

  def call
    @event.link
    response = HTTP.get "https://api.rebrandly.com/v1/links/new?apikey=#{ENV['REBRANDLY']}&destination=#{@event.link}&domain[fullName]=l.clubster.io"
    body = JSON.parse(response.to_s)
    url = body['shorturl']
    @event.update!(shorturl: url)
  end
end
