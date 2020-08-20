def artist_lookup
    prompt = TTY::Prompt.new
    pastel = Pastel.new
    whats_their_name = ""
        artistname = prompt.ask("Do you know their name? We'll check it against our database of artists!") {|q| q.modify :capitalize}
                    
            if Artist.all.find_by name: artistname
                whats_their_name = Artist.all.find_by name: artistname
                make_appt = prompt.yes?("Found them! Nice! We love #{artistname}. Would you like to make an appointment with them?")

                if make_appt == true
                        search = prompt.collect do
                        description = key(:description).ask("Tell us what work you'd like done.", required: true)
                        date = key(:date).ask("And when were you planning on comming in? Month, day, and year please!", required: true)
                        prompt.ask("Sweet, thanks #{Client.all.last.name}! We're gonna run it back to you so you can let us know if there's anything we missed:")
                        prompt.ask("Your name is #{Client.all.last.name}, and your artist's name is #{whats_their_name.name}...")
                        prompt.ask("And we've got you down for #{date} at #{whats_their_name.tattoo_shop.name} in #{whats_their_name.tattoo_shop.location} and you told us you wanted: #{description}.")
                        #binding.pry
                        newappt = Appointment.new(client: Client.all.last, date: date, description: description, artist:  whats_their_name, tattoo_shop: whats_their_name.tattoo_shop)
                        end
                        var = prompt.yes?("Does this all check out with you?")
                
                            if var == true
                                newappt.save
                                anything_else
                            elsif 
                                var == false
                                prompt.ask("Okay – Let's start over!")
                                #build out this function to somehow go back to getting the appointment information above. 
                            end      
                     
                elsif make_appt == false
                    #other_options = ["Just checking out TattedPortal."]#Just checking out TattedPortal.make respondant method that exits out of program
                    prompt.ask("Okay, no problem. Have a great one!")#code here for when artist is found in database but appt is not desired 
                end
            else 
                prompt.ask("Hmm...")#first if correspondant
                prompt.ask("We dont know 'em!")
                help_search
            end

end#ends first if
    


def anything_else
    prompt = TTY::Prompt.new
    anythingelse = prompt.no?("Great – we just made your appointment. You're on your way to your next tattoo! Is there anything else we can help you with?") 
        if anythingelse == true 
              prompt.ask("Well alrighty then. Thanks for visiting TattedWorld and see you next time.") 
              puts pastel.yellow("Stay golden.")
              anythingelse = prompt.no?("Great – we just made your appointment. You're on your way to your next tattoo! Is there anything else we can help you with?") 
                                  
    
        elsif anythingelse == false 
                changeclientappointment = prompt.select("What else can we help you with?", ["Change Appointment", "Nevermind."])
                        if changeclientappointment == "Change Appointment"
                                change_appointment 
                        else 
                            puts pastel.yellow("Stay golden.")
                        end
        end
end
