class Event < ApplicationRecord
    belongs_to :casting_agent
    has_many :auditions
    has_many :actors, through: :auditions
    has_many :submissions
end
