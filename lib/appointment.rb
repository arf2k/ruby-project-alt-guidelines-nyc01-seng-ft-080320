class Appointment < ActiveRecord::Base
    belongs_to :artist
    belongs_to :client
    belongs_to :tattoo_shop

    def self.find_clients(client_id)
        found_client = self.all.select do |appt|
            appt.client.id == client_id 
        end 
    end 
end