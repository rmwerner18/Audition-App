class Actor < ApplicationRecord
    has_many :auditions
    has_many :events, through: :auditions
    has_many :casting_agents, through: :events
end
