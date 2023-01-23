class Grill < ApplicationRecord
    has_many :bookings
    belongs_to :user, :optional => true
end
