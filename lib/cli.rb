require 'pry'


def welcoming_new_client
prompt = TTY::Prompt.new(active_color: :red)

     prompt.ask("Welcome to TattedPortal!")
     been_here_before = prompt.yes?("Have you been to TattedPortal before?")
    if been_here_before == true
        id_number = prompt.ask("Great – whats your client id:", required: true) 
        #binding.pry
        existing_client = Client.all.find_by(id: id_number)
        Client.remember_current_client_id(id_number)
        Client.remember_current_client_instance(existing_client)
        prompt.ask("Welcome back #{Client.current_client_instance.name}")
        #binding.pry #configure option for when client cant be found
        menu_options                                          #also if they cant remember id
    elsif been_here_before == false  
        newclient = prompt.ask("No worries, we just need to set you up in our system. Can you give us your name?", required: true){|q| q.modify :capitalize}
        created_new_client = Client.create(name: newclient)
        Client.remember_current_client_id(created_new_client.id)
        Client.remember_current_client_instance(created_new_client)
        #binding.pry
        prompt.ask("Great! Welcome, #{newclient}! Your client id is #{created_new_client.id}. Please store your id number somewhere safe for the future! Let's get started.")
        menu_options
    end
end

def menu_options
prompt = TTY::Prompt.new(active_color: :red)
    #client should also be given option to look at database of artists
    initialpromptoptions = ["Look for an artist", "Make an appointment", "Change or cancel appointment", "General Search"]
    selectedoption = prompt.select("What would you like to do?", initialpromptoptions)
    
    if selectedoption == initialpromptoptions[0] 
        artist_lookup
    elsif selectedoption == initialpromptoptions[1]
        make_an_appointment 
    elsif selectedoption == initialpromptoptions[2]
        change_appointment #should be able to look up appointments that exist and change them. 
    elsif selectedoption == initialpromptoptions[3]
        general_search
    end
    
end






