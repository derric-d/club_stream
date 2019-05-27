class EventsController < ApplicationController

  private

  def event_params
    params.require(:user).permit(:name, :date, :description, :link, :tag_list) ## Rails 4 strong params usage
  end
end
