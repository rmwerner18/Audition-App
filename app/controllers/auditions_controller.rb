class AuditionsController < ApplicationController
    before_action :authenticate!
    
    def index
        if current_casting_agent
            @auditions = Audition.order_by_time.find_all_by_casting_agent(current_casting_agent)
        elsif current_actor
            @auditions = Audition.order_by_time.where(actor: current_actor)
        end
        @dates = @auditions.map {|audition| audition.event.date}.uniq
        @dates.sort
    end

    def show
        @audition = Audition.find(params[:id])
    end

    def new
        @audition = Audition.new
    end

    def create
        @audition = Audition.create(audition_params)
        if @audition.valid?
            @requests = Request.where(event: @audition.event, actor: @audition.actor)
            if @requests
                @requests.each {|request| request.delete}
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

    def destroy
        @audition = Audition.find(params[:id])
        @audition.delete
        flash[:message] = "Audition has been cancelled!"
        redirect_to auditions_path
    end

    private

    def audition_params
        params.require(:audition).permit(:event_id, :actor_id, :time)
    end
    
end

