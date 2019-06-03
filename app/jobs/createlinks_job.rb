class CreatelinksJob < ApplicationJob
  require 'open-uri'
  require 'json'
  queue_as :default

  def perform
    response = open("https://api.rebrandly.com/v1/links/new?apikey=#{ENV['REBRANDLY']}&destination=#{self.url}&domain[fullName]=l.clubster.io").read
    parsed = JSON.parse(response)
    p = parsed["shortURL"]
    self.update!(shorturl: p)
  end
end

