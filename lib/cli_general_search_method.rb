def general_search
    prompt = TTY::Prompt.new
        prompt.ask("Take a look at the options below and let us know how you'd like to filter your search.")
        filter_options = ["Style", "Location", "Wanna get a piercing, too?"]
        chosen_filter = prompt.select("How would you like to filter your search?",filter_options)
    
        if chosen_filter[0]#style
            make_an_appointment_by_style
    
        elsif chosen_filter[1]#location
    
        elsif chosen_filter[2]#does piercings
        
    
        end
    
    end