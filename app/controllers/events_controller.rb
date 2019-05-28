class EventsController < ApplicationController
  def find_events
    require 'nokogiri'
    require 'open-uri'

    url = 'https://www.residentadvisor.net/club.aspx?id=5031'

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search('#items .list ul').each do |element|
      text = element.text.strip
      # puts element.attribute('href').value
    end
    return text
  end

  private

  def event_params
    params.require(:user).permit(:name, :date, :description, :link, :tag_list) ## Rails 4 strong params usage
  end
end
