class ActorsController < ApplicationController
    def index
        @actors = Actor.all
    end

    def show
        find_actor
    end

    def new
        @actor = Actor.new
    end

    def create
        @actor = Actor.create(actor_params)
        redirect_to @actor
    end

    def edit
        find_actor
    end

    def update
        find_actor
        @actor.update(actor_params)
        redirect_to @actor
    end

    def delete

    end

    private

    def actor_params
        params.require(:actor).permit(:name, :sex, :age)
    end

    def find_actor
        @actor = Actor.find(params[:id])
    end
    
end
