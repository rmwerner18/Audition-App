class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.create(event_params)
        redirect_to events_path
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
        @event.update(event_params)
        redirect_to events_path
    end

    def delete

    end

    private

    def event_params
        params.require(:event).permit(:title, :date, :location, :production_type, :casting_agent_id)
    end

end
