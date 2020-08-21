def change_appointment 
    prompt = TTY::Prompt.new
    client_appointments = Appointment.all.find_by(client: Client.current_client_instance) 
    
    if client_appointments == nil
        prompt.ask("Uh-oh. Looks you haven't made an appoint with us yet.")
        prompt.ask("Let's make a new appointment then")
        make_an_appointment
    
    else    
        prompt.ask("#{Client.current_client_instance.name}, we found your appointment on #{client_appointments.date} at #{client_appointments.tattoo_shop.name}")
        options = ["Change Appointment", "Cancel Appointment"]
        selected_option = prompt.select("Would you like to change or cancel this appointment?", options)
    
        if selected_option == options[0]
            prompt.ask("Great. Please answer a few questions:")
        
                prompt.collect do
                    new_date = key(:date).ask("What day should we set your new appointment?", required: true)
                    new_time = key(:time).ask("Got it. What time?", required: true)
                    new_description = key(:description).ask("Please verify the work you would like done by providing a description", required: true)
                    client_appointments.update(date: new_date, time: new_time, description: new_description)
                    prompt.ask("#{client_appointments.client.name}, we will now see you on #{new_date} at #{new_time} to get your #{new_description}")
                    prompt.ask("Thanks so much for stopping by TattedPortal! See you soon.")
                end

        elsif selected_option == options[1]
            client_appointments.destroy
            prompt.ask("Sorry to hear. Hope to see you again soon!")
        end
    end
end