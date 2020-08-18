class Audition < ApplicationRecord
    belongs_to :event
    belongs_to :actor
    validates :time, uniqueness: { scope: :actor, message: "This actor already has an audition at this time" }
    validates :time, uniqueness: { scope: :event, message: "There is already an audition for this event at this time" }
    
end
