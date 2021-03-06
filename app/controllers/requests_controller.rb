class RequestsController < ApplicationController
    before_action :authenticate!

    def index
        if current_casting_agent
            @requests = Request.find_all_by_casting_agent(current_casting_agent)
        elsif current_actor
            @requests = Request.where(actor: current_actor)
        end
    end

    def new
        @request = Request.new
    end

    def create
        @request = Request.new(request_params)
        @request.actor = current_actor
        @request.save
        redirect_to request_path(@request)
    end
    
    def show
        @request = Request.find(params[:id])
    end

    def update
        @request = Request.find(params[:id])
        flash[:event] = @request.event
        flash[:actor] = @request.actor
        flash[:requested_time] = @request.requested_time
        redirect_to new_audition_path
    end

    def destroy
        @request = Request.find(params[:id])
        @request.delete
        redirect_to requests_path
    end

    private

    def request_params
        params.require(:request).permit(:actor_id, :event_id, :requested_time)
    end
end
