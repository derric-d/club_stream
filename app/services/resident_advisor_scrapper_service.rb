require 'nokogiri'
require 'open-uri'

class Resident
  def initialize

  end

  def find_events
    # url = 'https://www.residentadvisor.net/events/de/berlin/day/2019-05-28'
    file = 'resAdEvents.html'

    html_file = open(file).read
    html_doc = Nokogiri::HTML(html_file)

    text = []
    html_doc.search('.event-item').each do |element|
      text << element.text.strip
    end
    text
  end
end
