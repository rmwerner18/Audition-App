class Audition < ApplicationRecord
    belongs_to :event
    belongs_to :actor
    validates :time, uniqueness: { scope: :actor, message: "This actor already has an audition at this time" }
    validates :time, uniqueness: { scope: :event, message: "There is already an audition for this event at this time" }
    validates :actor, presence: true

    def find_casting_agent
        self.event.casting_agent
    end

    def self.find_all_by_casting_agent(casting_agent)
        Audition.all.select {|audition| audition.find_casting_agent == casting_agent}
    end
end
