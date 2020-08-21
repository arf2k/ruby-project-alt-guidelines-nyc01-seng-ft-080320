def make_an_appointment
prompt = TTY::Prompt.new

    prompt.ask("Ready to get inked!? Let's set the date. We just need some information from you.")
    prompt.collect do
                date = key(:date).ask("What day should we set your new appointment? Make sure to enter MM/DD/YY. PLease and thank you!", required: true)
                time = key(:time).ask("Got it. What time?", required: true)
                description = key(:description).ask("Let us know what you'd like done.", required: true)
                who_is_it = prompt.no?("Do you know who you want to work with?")
                    if who_is_it == true
                        prompt.ask("Don't worry – We'll choose for you! Wild card!")
                        prompted_artist = Artist.all[4]
                    elsif who_is_it == false
                        prompted_artist = key(:artist).ask("Great – who is it?"){|q| q.modify :capitalize}
                        found_artist = ""     
                            if Artist.all.find_by(name: prompted_artist)
                                found_artist = Artist.all.find_by(name: prompted_artist)
                                prompt.ask("Cool – found 'em in our database.")
                                Appointment.create(client: Client.current_client_instance, artist: found_artist, tattoo_shop: found_artist.tattoo_shop, date: date, time: time, description: description)
                                prompt.ask("Okay, #{Client.current_client_instance.name}, we've got your appointment down for #{date} at #{time} for what you described as: #{description}.")
                                prompt.ask("And your appointment is at #{found_artist.tattoo_shop.name} with #{found_artist.name}")
                                prompt.ask("Thanks for stopping by and see you then!")
                             else
                            prompt.ask("Hmm...")
                            prompt.ask("Well this is embarrasing. We don't think that artist is partnered with us.")
                            prompt.ask("Lets look at some options and try to inspire!")
                            general_search
                           end
                    end
                end
end


def verify_artist(artistname)
    if Artist.all.find_by name: artistname
        prompt.ask("Great")
    end
end
