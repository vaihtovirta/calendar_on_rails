class EventsController < ApplicationController
  include TimeParamsHandler

  respond_to :html

  before_action :authenticate_user!

  expose :calendar, -> { CalendarHelper.new(events) }
  expose :event
  expose :events, -> { Event.includes(:user).by_date(start_date).map(&:decorate) }

  def index
    respond_with events
  end

  def show
    self.event = event.decorate

    respond_modal_with event
  end
end
