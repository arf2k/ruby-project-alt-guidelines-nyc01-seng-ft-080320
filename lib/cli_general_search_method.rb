def general_search
    prompt = TTY::Prompt.new
        filter_options = ["Style", "Location"]
        chosen_filter = prompt.select("Choose a search a option:",filter_options)
        if chosen_filter == filter_options[0]#style
            filter_by_style
    
        elsif chosen_filter == filter_options[1]#location
            filter_by_location
        end
    
end

def filter_by_style
prompt = TTY::Prompt.new
            
    stylechosen = prompt.select("What kind of style are you looking for?", ["black work", "traditional", "new school", "tribal"])
            
    artiststring = []
    artistarray = []
    appointments = []
        
    Artist.all.select do |artists| 
        if artists.style == stylechosen
                artiststring << "#{artists.name} – Does #{artists.style} at #{artists.tattoo_shop.name} in #{artists.tattoo_shop.location}" 
                artistarray << artists.name
                #current_client = Client.all.find_by
                appointments << Appointment.new(client: Client.current_client_instance, artist: artists, tattoo_shop: artists.tattoo_shop)
                #binding.pry
        end
    end
            

        chosenartist = [] 
        appointments
        chosenartist = prompt.select("Here are some experts in that style. Choose one to make an appointment!", artistarray) 
        make_an_appointment
end
        
def filter_by_location
prompt = TTY::Prompt.new
prompt.ask("Location!")

    tatt_shop_locations = []
    TattooShop.all.map do |eachtattooshop|
        tatt_shop_locations << eachtattooshop.location
    end
    tatt_shop_locations.uniq!
    selected_borough = prompt.select("Select the borough you'd like to see a list of TattedPortal member Tattoo Shops in.", tatt_shop_locations)
    shops_in_the_borough = Array.new
    TattooShop.all.select do |tattoo_shops_by_borough|
        if tattoo_shops_by_borough.location == selected_borough
            shops_in_the_borough << tattoo_shops_by_borough
        end
    end
    shops_in_the_borough
    names_of_shops = Array.new
    shops_in_the_borough.select do |eachshop| 
         names_of_shops << eachshop.name
         #binding.pry
    end 
    shop = prompt.select("Here's a list of Tattoo Shops in #{selected_borough}", names_of_shops)
    make_appt_query = prompt.no?("Would you like to set up an appointment at #{shop}")
    if make_appt_query == true
        prompt.ask("Well, goodbye")
    elsif make_appt_query == false
        prompt.ask("Great – let's make an appointment!")
        make_an_appointment
    end
end
