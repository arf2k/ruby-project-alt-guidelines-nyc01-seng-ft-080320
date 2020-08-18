class Appointment < ActiveRecord::Base
    belongs_to :artist
    belongs_to :client
    belongs_to :tattoo_shop
end