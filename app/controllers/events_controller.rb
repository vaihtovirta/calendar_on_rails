class EventsController < ApplicationController
  include TimeHandler

  respond_to :html

  before_action :authenticate_user!

  expose(:events)
  expose(:event)

  def index
    self.events = Event.by_date(start_date).map(&:decorate)

    respond_with events
  end

  def show
    self.event = event.decorate

    respond_modal_with event
  end
end
