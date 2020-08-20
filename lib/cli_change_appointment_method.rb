def change_appointment 
    prompt = TTY::Prompt.new
    #client_id = prompt.ask("Enter your id one more time:", required: true)
    #client_appointments = []
    # client_appointments = Appointment.all.map do |appt|
    #     appt.client.id == Client.current_client 
    client_appointments = Appointment.all.find_by client: Client.current_client 
    # client_appointments.client_id.name 
    prompt.ask("#{client_appointments.client.name}, we found your appointment on #{client_appointments.date}")

    prompt.collect do
        new_date = key(:date).ask("What day should we set your new appointment?", required: true)
        new_time = key(:time).ask("Got it. What time?", required: true)
        new_description = key(:description).ask("Please verify the work you would like done by providing a description", required: true)
        prompt.ask("#{client_appointments.client.name}, we will now see you on #{new_date} at #{new_time} to get your #{new_description}")
    end
     
              
    #     if appt.client.id == client_id 
    #        appt.client
    #     end
    # end
    # client_appointments
    #binding.pry
    #prompt.select("Here is a list of your appointments:",client_appointments)
end