class EventsController < ApplicationController
    before_action :authenticate_casting_agent!, except: [:index, :show]

    def index
        @events = Event.search(params[:q])
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        @event.casting_agent = current_casting_agent
        @event.save
        if @event.valid?
            redirect_to events_path
        else 
            flash[:errors] = @event.errors.full_messages
            redirect_to new_event_path
        end
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
        @event.update(event_params)
        redirect_to events_path
    end

    def destroy
        Event.find(params[:id]).destroy
        redirect_to events_path
    end


    private

    def event_params
        params.require(:event).permit(:title, :date, :location, :production_type, :casting_agent_id, :pic, :q)
    end

end
