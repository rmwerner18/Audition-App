class CastingAgent < ApplicationRecord
    has_many :events
    has_many :auditions, through: :events
    has_many :actors, through: :auditions
end
