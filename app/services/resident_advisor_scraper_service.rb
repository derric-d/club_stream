require 'nokogiri'
require 'open-uri'
require 'mechanize'

class ResidentAdvisorScraperService

  # def find_events
  #   url = 'https://www.residentadvisor.net/events/de/berlin/day/2019-05-28'
  #   file = 'resAdvisorEvents.html'

  #   html_file = open(file).read
  #   html_doc = Nokogiri::HTML(html_file)

  #   text = []
  #   html_doc.search('.event-item').each do |element|
  #     text << element.text.strip
  #   end
  #   text
  # end

  def find_events_with_mechanize
    agent = Mechanize.new
    # todays_date = Date.today.strftime('%Y-%m-%d').next!
    # page = agent.get("https://www.residentadvisor.net/events/de/berlin/day/#{todays_date}")
    page = agent.get("https://www.residentadvisor.net/events/de/berlin/week/2019-05-31")

    event_links = page.links_with(href: %r{\/events\/[0-9]+$})
    event_links.reject! do |link|
      parent_classes = link.node.parent['class'].split
      parent_classes.any? { |p| ["event-title"].include?(p) }
    end
    # event_links = event_links[0..5]
    event_links.each do |link|
      begin
        event_page = link.click
        ra_id = event_page.uri.to_s.scan(/\/([0-9]+)/).first.first.to_i
        date = event_page.search('.cat-rev')[0].text
        # make location the name of the club
        club_name = event_page.search('.cat-rev')[1].text
        lineup = event_page.search('.lineup').text
        club = Club.find_by(name: club_name) || Club.create(name: club_name)
        # name is the event_page name
        name = event_page.search('#sectionHead h1').text
        description = event_page.search('p').text
        full_link = 'https://www.residentadvisor.net' + link.uri.to_s
        event = Event.find_by(ra_id: ra_id)
        event ||= Event.new
        event.update!(date: date, name: name, link: full_link, description: description, club_name: club_name, club: club, ra_id: ra_id, lineup: lineup)
      rescue
      end
    end
  end
end
