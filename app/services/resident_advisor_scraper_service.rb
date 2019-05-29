require 'nokogiri'
require 'open-uri'

class Resident
  def initialize

  end

  def find_events
    # url = 'https://www.residentadvisor.net/events/de/berlin/day/2019-05-28'
    file = 'resAdvisorEvents.html'

    html_file = open(file).read
    html_doc = Nokogiri::HTML(html_file)

    text = []
    html_doc.search('.event-item').each do |element|
      text << element.text.strip
    end
    text
  end




  def find_events_with_mechanize


  agent = Mechanize.new
  page = agent.get("https://www.residentadvisor.net/events/de/berlin/day/2019-05-28")

  event_links = page.links_with(href: %r{\/events\/[0-9]+$})
  event_links.reject! do |link|
    parent_classes = link.node.parent['class'].split
    parent_classes.any? { |p| ["event-title"].include?(p) }
  end

  event_links.each do |link|
    event = link.click
    date = event.search('.cat-rev')[0].text
    location = event.search('.cat-rev')[1].text
    name = event.search('#sectionHead h1').text

    puts "#{name} takes place on #{date} at #{location}."
  end
end
end
