def general_search
    prompt = TTY::Prompt.new
        prompt.ask("Let us know how you'd like to filter your search.")
        filter_options = ["Style", "Location", "Wanna get a piercing, too?"]
        chosen_filter = prompt.select("How would you like to filter your search?",filter_options)
        if chosen_filter == filter_options[0]#style
            filter_by_style
    
        elsif chosen_filter == filter_options[1]#location
            filter_by_location
    
        elsif chosen_filter == filter_options[2]#does piercings
            filter_by_piercings
        end
    
end

def filter_by_style
prompt = TTY::Prompt.new
            
    stylechosen = prompt.select("What kind of style are you looking for?", ["black work", "traditional", "new school", "tribal", "traditional", "no preference"])
            
    artiststring = []
    artistarray = []
    appointments = []
        
    Artist.all.select do |artists| 
        if artists.style == stylechosen
                artiststring << "#{artists.name} – Does #{artists.style} at #{artists.tattoo_shop.name} in #{artists.tattoo_shop.location}" 
                artistarray << artists
                current_client = Client.all.find_by
                appointments << Appointment.new(client: Client.current_client, artist: artists, tattoo_shop: artists.tattoo_shop)
                #binding.pry
        end
    end
            

            # prompt.collect do
            #     new_date = key(:date).ask("What day should we set your new appointment?", required: true)
            #     new_time = key(:time).ask("Got it. What time?", required: true)
            #     new_description = key(:description).ask("Please verify the work you would like done by providing a description", required: true)
            #     client_appointments.update(date: new_date, time: new_time, description: new_description)
            #     prompt.ask("#{client_appointments.client.name}, we will now see you on #{new_date} at #{new_time} to get your #{new_description}")
            #     end


        chosenartist = [] 
        appointments
        chosenartist = prompt.select("Here are some experts in that style. Choose one to make an appointment!", artistarray) 
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
    prompt.select("Here's a list of Tattoo Shops in #{selected_borough}", names_of_shops)

end
