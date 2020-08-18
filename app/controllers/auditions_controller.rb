class AuditionsController < ApplicationController
    def index
        @auditions = Audition.all
    end

    def show
    end

    def new
        @audition = Audition.new
    end

    def create
        if flash[:event] && flash[:actor] && flash[:requested_time]
            @audition = Audition.create(event_id: flash[:event], actor_id: flash[:actor], time: Time.parse(flash[:requested_time]).strftime("%I:%M %p"))
        else
            @audition = Audition.create(audition_params)
        end
        if @audition.valid?
            request = Request.find_by(actor_id: @audition.actor_id, event_id: @audition.event_id)
            if request
                request.delete
            end
            redirect_to auditions_path
        else 
            render 'new'
        end
    end

    def edit
        @audition = Audition.find(params[:id])
    end

    def update
        @audition = Audition.find(params[:id])
        @audition.update(audition_params)
        redirect_to auditions_path
    end

    def delete

    end

    private

    def audition_params
        params.require(:audition).permit(:event_id, :actor_id, :time)
    end
    
end

