module Users
  class EventsController < ApplicationController
    include TimeParamsHandler

    respond_to :html
    respond_to :js, only: %i(create update)

    expose :calendar, -> { CalendarHelper.new(events) }
    expose :event
    expose :events, -> { current_user.events.by_date(start_date).map(&:decorate) }

    before_action :authenticate_user!
    before_action :redirect_to_events, only: %i(new edit)

    def index
      respond_with events, template: "events/index"
    end

    def new
      event.starts_at = init_time

      respond_modal_with event
    end

    def create
      event.user = current_user
      event.save

      respond_modal_with events, location: events_path(start_date: event_start_time_param)
    end

    def edit
      respond_modal_with event
    end

    def update
      event.update(event_params)

      respond_modal_with event, location: events_path(start_date: event_start_time_param)
    end

    def destroy
      event.destroy

      redirect_to events_path
    end

    protected

    def redirect_to_events
      redirect_to events_path unless request.xhr?
    end

    def event_start_time_param
      event.starts_at.strftime("%Y-%m-%d")
    end

    def event_params
      params.require(:event).permit(:id, :user_id, :title, :description, :starts_at, :periodicity)
    end
  end
end
