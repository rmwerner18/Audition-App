class Audition < ApplicationRecord
    belongs_to :event
    belongs_to :actor
    validates :time, uniqueness: { scope: :actor, message: "This actor already has an audition at this time" }
    validates :time, uniqueness: { scope: :event, message: "There is already an audition for this event at this time" }
    validates :actor_id, presence: true

    def find_casting_agent
        if self.event
            self.event.casting_agent
        end
    end

    def self.find_all_by_casting_agent(casting_agent)
        Audition.all.select {|audition| audition.find_casting_agent == casting_agent}
    end

    def formatted_date
        self.event.date.strftime("%B %d, %Y")
    end

    def formatted_time
        self.time.strftime("%I:%M %p")
    end
    
    def self.order_by_time
        self.order('time ASC')
    end

    # def self.order_by_date_and_time
    #     Event.order('date ASC')
    #     Event.all.map do |event| 
    #         event.auditions.order_by_time
    #     end
    # end
end
