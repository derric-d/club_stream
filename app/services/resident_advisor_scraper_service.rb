require 'nokogiri'
require 'open-uri'
require 'mechanize'

class ResidentAdvisorScraperService

  def find_events_with_mechanize

    agent = Mechanize.new
    todays_date = Date.today.strftime('%Y-%m-%d')
    page = agent.get("https://www.residentadvisor.net/events/de/berlin/week/#{todays_date}")
    # page = agent.get("https://www.residentadvisor.net/events/de/berlin/week/2019-05-31")

    event_links = page.links_with(href: %r{\/events\/[0-9]+$})
    event_links.reject! do |link|
      parent_classes = link.node.parent['class'].split
      parent_classes.any? { |p| ["event-title"].include?(p) }
      parent_classes.any? { |p| ["event-item"].include?(p) }
    end

    # event_links = event_links[0..5]
    # Event.destroy_all
    event_links.each do |link|
      event_page = link.click
      ra_id = event_page.uri.to_s.scan(/\/([0-9]+)/).first.first.to_i
      next if Event.find_by(ra_id: ra_id).present?

      details = event_page.search('#detail li')
      date = details[0].search('a').text
      next if date.nil?
      # make location the name of the club
      # club_name = details[1]&.text
      # club_name = event_page.search('.cat-rev')[1].text
      club_name = event_page.search('.wide a.cat-rev').text.to_s
      next if club_name.nil?

      lineup = event_page.search('.lineup').text
      club = Club.find_by(name: club_name) || Club.create(name: club_name)
      # name is the event_page name
      name = event_page.search('h1')[0].text
      description = event_page.search('#event-item .left p')[1].text
      full_link = 'https://www.residentadvisor.net' + link.uri.to_s
      event = Event.find_by(ra_id: ra_id)
      event ||= Event.new
      event.update!(date: date, name: name, link: full_link, description: description, club_name: club_name, club: club, ra_id: ra_id, lineup: lineup)
    end
  end
end
