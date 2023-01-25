class Grill < ApplicationRecord
    has_many :bookings
    belongs_to :user, :optional => true
    geocoded_by :location
    after_validation :geocode
end
