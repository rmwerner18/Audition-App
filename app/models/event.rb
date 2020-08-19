class Event < ApplicationRecord
    belongs_to :casting_agent
    has_many :auditions
    has_many :actors, through: :auditions
    has_many :submissions
    validates :title, presence: :true

    def self.search(search)
        if search
            if search[:id].length > 0 
            casting_agent = CastingAgent.find(search[:id])
                if casting_agent
                    Event.where(casting_agent_id: casting_agent.id)
                else 
                    Event.all
                end
            else Event.all
            end
        else 
            Event.all
        end
    end
end
