class RequestsController < ApplicationController
    def index
        @requests = Request.all
    end

    def new
        @request = Request.new
    end

    def create
        @request = Request.create(request_params)
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
        @request.delete
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
