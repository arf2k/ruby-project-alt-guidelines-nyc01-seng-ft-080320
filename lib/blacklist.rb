class Blacklist < ActiveRecord::Base
    has_many :clients
    belongs_to :tattoo_shop
end