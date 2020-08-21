def make_an_appointment
prompt = TTY::Prompt.new

    prompt.ask("Ready to get inked!? Let's set the date. We just need some information from you.")
    prompt.collect do
                date = key(:date).ask("What day should we set your new appointment?", required: true)
                time = key(:time).ask("Got it. What time?", required: true)
                description = key(:description).ask("Let us know what you'd like done.", required: true)
                who_is_it = prompt.no?("Do you know who you want to work with?")
                    if who_is_it == true
                        prompt.ask("Don't worry – We'll choose for you! Wild card!")
                        prompted_artist = Artist.all[4]
                    elsif who_is_it == false
                        prompted_artist = key(:artist).ask("Great – who is it?")
                            verify_artist(artist_known)
                    end
                
                Appointment.create(client: Client.current_client_instance, artist: prompted_artist, tattoo_shop: prompted_artist.tattoo_shop, date: date, time: time, description: description)
                prompt.ask("#{Client.current_client_instance.name}, we will now see you on #{date} at #{time} to get your #{description} at #{prompted_artist.tattoo_shop.name} with #{prompted_artist.name}")
                end
end

def verify_artist(artistname)
    if Artist.all.find_by name: artistname
        prompt.ask("Great")
    end
end
