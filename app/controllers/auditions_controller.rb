class AuditionsController < ApplicationController
    def index
        @auditions = Audition.all
    end

    def show
        @audition = Audition.find(params[:id])
    end

    def new
        @audition = Audition.new
    end

    def create
        @audition = Audition.new(audition_params)
        redirect_to auditions_path
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

