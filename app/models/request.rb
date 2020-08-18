class Request < ApplicationRecord
    belongs_to :actor
    belongs_to :event
end
