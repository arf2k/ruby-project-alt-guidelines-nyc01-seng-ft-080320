class Artist < ActiveRecord::Base
    belongs_to :tattoo_shop
    has_many :appointments
    has_many :clients, through: :appointments
end