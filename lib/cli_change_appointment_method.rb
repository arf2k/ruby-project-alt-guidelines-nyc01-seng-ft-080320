def change_appointment 
    prompt = TTY::Prompt.new
    #client_id = prompt.ask("Enter your id one more time:", required: true)
    #client_appointments = []
    # client_appointments = Appointment.all.map do |appt|
    #     appt.client.id == Client.current_client 
    client_appointments = Appointment.all.find_by client: Client.current_client 
    # client_appointments.client_id.name 
    prompt.ask("We found your appointment on #{client_appointments.date}")
    binding.pry   
              
    #     if appt.client.id == client_id 
    #        appt.client
    #     end
    # end
    # client_appointments
    #binding.pry
    #prompt.select("Here is a list of your appointments:",client_appointments)
end