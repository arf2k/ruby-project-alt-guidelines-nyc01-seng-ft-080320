require 'pry'

def make_an_appointment
prompt = TTY::Prompt.new
    
    stylechosen = prompt.select("What kind of style are you looking for?", ["black work", "traditional", "new school", "tribal", "traditional", "no preference"])
    
    artiststring = []
    artistarray = []

    Artist.all.select do |artists| 
        if artists.style == stylechosen
            artiststring << "#{artists.name} – Does #{artists.style} at #{artists.tattoo_shop.name} in #{artists.tattoo_shop.location}" 
            artistarray << artists
        end
    end
    
    chosenartist = prompt.multi_select("Here are some experts in that style. Choose one to make an appointment!", artiststring) 
    artistarray
    #binding.pry
end



def welcoming_new_client
prompt = TTY::Prompt.new(active_color: :red)

    newclient = prompt.ask("Welcome to TattedPortal! What's your name?", required: true){|q| q.modify :capitalize}
    Client.create(name:newclient)
    prompt.ask("Great! Welcome, #{newclient}. Let's get started.")
    
    
    initialpromptoptions = ["Look for an artist", "Make an appointment", "Change appointment"]
    selectedoption = prompt.select("What would you like to do?", initialpromptoptions)
    
    if selectedoption == initialpromptoptions[0] 
        artist_lookup
    elsif selectedoption == initialpromptoptions[1]
        make_an_appointment 
    elsif selectedoption == initialpromptoptions[2]
        change_appointment
    end

end

def artist_lookup
prompt = TTY::Prompt.new
pastel = Pastel.new
            
    artistname = prompt.ask("Do you know their name? We'll check it against our database of artists!") {|q| q.modify :capitalize}
                
        if Artist.all.find_by name: artistname
            whats_their_name_answer = Artist.all.find_by name: artistname
            prompt.yes?("Found them! Nice! We love #{artistname}. Would you like to make an appointment with them?")
            prompt.collect do
                description = key(:description).ask("Cool. First thing's first: What are you planning on getting?", required: true)
                date = key(:date).ask("And when were you planning on comming in? Month, day, and year please!", required: true)
                prompt.ask("Sweet, thanks #{Client.all.last.name}! We're gonna run it back to you so you can let us know if there's anything we missed:")
                prompt.yes?("Your name is #{Client.all.last.name}, and your artist's name is #{artistname}...")
                prompt.yes?("And we've got you down for #{date} at #{whats_their_name_answer.tattoo_shop.name} in #{whats_their_name_answer.tattoo_shop.location} and you told us you wanted: #{description}.")
                newappt = Appointment.new(client: Client.all.last, date: date, description: description, artist: whats_their_name_answer, tattoo_shop: whats_their_name_answer.tattoo_shop)
                anythingelse = prompt.no?("Great – we just made your appointment. You're on your way to your next tattoo! Is there anything else we can help you with?") 
                     if anythingelse == true 
                        prompt.ask("Well alrighty then. Thanks for visiting TattedWorld and see you next time.") 
                        puts pastel.yellow("Stay golden.")
                        newappt.save
                        # at this point, everything is set and we can finally save this appointment instance. however
                        # if user selects yes help me with something else, the appointment remains in new but not saved. 
                        # lets not use #create off the bat to avoid having a giant appointment list full of things
                        # that might not be solid yet.
                     elsif anythingelse == false 
                        changeclientappointment = prompt.select("What else can we help you with?", ["Change Appointment", "Nevermind."])
                            if changeclientappointment == "Change Appointment"
                                change_appointment 
                                # change_appointment should ask if they want to change the appointment they just had or see if they can find any other 
                                # existing appoint of this client...this might entail having to make a sign in feature, since technically each 
                                # time we run the program, a new client gets created, thus though the same name might show up on the list, it'll be a different
                                # instance, so technically a whole new person. as it stands, this program doesnt allow for a client to have "past" appointments. 
                            else puts pastel.yellow("Stay golden.")
                            end
                    end
            end
        else prompt.ask("Hmm...")
            prompt.ask("We dont know 'em!")
            help_search
    end
end

def change_appointment 
    prompt = TTY::Prompt.new
    prompt.ask("lets hope this works!")
end

def help_search
prompt = TTY::Prompt.new
    
    prompt.ask("No worries, though – we'll help you find the right person for you.")
    prompt.select("How would you like to filter your search?",["Style", "Location", "Also Does Piercings", "Ambiance"])
end








