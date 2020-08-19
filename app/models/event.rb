class Event < ApplicationRecord
    belongs_to :casting_agent
    has_many :auditions
    has_many :actors, through: :auditions
    has_many :submissions

    def self.search(search)
        if search
            casting_agent = CastingAgent.find(search)
            if casting_agent
                Event.where(casting_agent_id: casting_agent.id)
            else 
                Event.all
            end
        else 
            Event.all
        end
    end
end
