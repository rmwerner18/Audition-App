class Request < ApplicationRecord
    belongs_to :actor
    belongs_to :event

    def find_casting_agent
        self.event.casting_agent
    end

    def self.find_all_by_casting_agent(casting_agent)
        Request.all.select {|audition| audition.find_casting_agent == casting_agent}
    end
end
