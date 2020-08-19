class AuditionsController < ApplicationController
    before_action :authenticate_casting_agent!
    def index
        @auditions = Audition.find_all_by_casting_agent(current_casting_agent)
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
        flash[:message] = "Audition has been deleted!"
        redirect_to auditions_path
    end

    private

    def audition_params
        params.require(:audition).permit(:event_id, :actor_id, :time)
    end
    
end

