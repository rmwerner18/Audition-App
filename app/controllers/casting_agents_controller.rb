class CastingAgentsController < ApplicationController
    def index
        @casting_agents = CastingAgent.all
    end

    def show
        @casting_agent = CastingAgent.find(params[:id])
        current_casting = @casting_agent
    end

    def new
        @casting_agent = CastingAgent.new
    end

    def create
        @casting_agent = CastingAgent.create(casting_agent_params)
        if @casting_agent.valid?
            redirect_to @casting_agent
        else redirect_to new_casting_agent_session_path
        end
    end

    def edit
        @casting_agent = CastingAgent.find(params[:id])
    end

    def update
        @casting_agent = CastingAgent.find(params[:id])
        @casting_agent.update(casting_agent_params)
        redirect_to @casting_agent
    end

    def delete

    end

    private

    def casting_agent_params
        params.require(:casting_agent).permit(:name, :agency)
    end

    
end
