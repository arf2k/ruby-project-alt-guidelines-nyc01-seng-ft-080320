class Client < ActiveRecord::Base 
    belongs_to :blacklist
    has_many :appointments 
    has_many :artists, through: :appointments

@@current_client_id = []
def self.remember_current_client(id)
    @@current_client_id << id
end

def self.current_client
    @@current_client_id 
end

end