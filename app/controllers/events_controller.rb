class EventsController < ApplicationController

  def events_matching_users
    Event.tagged_with([@user.tag_list], any: true)
  end

  def tagged
    if params[:tag].present?
      @events = event.tagged_with(params[:tag])
    else
      @events = event.all?
    end
  end

  # def populate_tags
  #   @event.description.split.each do |word|
  #     # unless hedges.include? word
  #     @event.tag_list.add('word')
  #   # end
  #   end
  #   @event.save
  # end

  private

  def event_params
    params.require(:event).permit(:name, :date, :description, :link, :tag_list) ## Rails 4 strong params usage
  end
end
