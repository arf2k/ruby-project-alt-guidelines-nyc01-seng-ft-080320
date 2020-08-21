class Client < ActiveRecord::Base 
    belongs_to :blacklist
    has_many :appointments 
    has_many :artists, through: :appointments


@@current_client_id = ""
@@current_client_instance = Array.new

def self.remember_current_client_id(id)
    @@current_client_id << id
end

def self.current_client_id
    @@current_client_id 
end

def self.remember_current_client_instance(instance)
    @@current_client_instance = instance
end

def self.current_client_instance
    @@current_client_instance
end

end