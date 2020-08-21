Client.destroy_all
TattooShop.destroy_all
Artist.destroy_all 
Appointment.destroy_all


alex = Client.create(name: "Alex", location: "Bronx")
sarahlee = Client.create(name:"Sarah Lee", location: "Bronx")
sarah = Client.create(name:"Sarah", location: "Brooklyn")
joe = Client.create(name:"Joe", location: "Queens")
paulo = Client.create(name:"Paulo", location: "Brooklyn")
ruby = Client.create(name: "Ruby", location: "Manhattan")
thelma = Client.create(name: "Thelma", location: "Queens")
antonio = Client.create(name: "Antonio", location: "Manhattan")
desmond = Client.create(name: "Desmond", location: "Brooklyn")
francis = Client.create(name: "Francis", location: "Brooklyn")


brooklyntattoo = TattooShop.create(name: "Brooklyn Tattoo", location: "Brooklyn", ambiance: "Casual", operational_hours: "10AM to 8PM")
bctattoo = TattooShop.create(name: "B.C. Tattoo", location: "Manhattan", ambiance: "Cool", operational_hours: "12PM to 6PM")
gnostic = TattooShop.create(name: "Gnostic", location: "Queens", ambiance: "Casual", operational_hours: "12PM to 5PM")
queenstattoo = TattooShop.create(name: "Queens Tattoo", location: "Queens", ambiance: "Casual", operational_hours: "7PM to 7PM")
hustleparlor = TattooShop.create(name: "Hustle Parlor", location: "Brooklyn", ambiance: "Upscale", operational_hours: "12PM to 12AM")
williamsburger = TattooShop.create(name: "Williamsburger", location: "Brooklyn", ambiance: "Dirty", operational_hours: "12PM to 7PM")
paintshop = TattooShop.create(name: "Paint Shop", location: "Queens", ambiance: "Cool", operational_hours: "10AM to 8PM")
tortoiseshell = TattooShop.create(name: "Tortoise Shell", location: "Staten Island", ambiance: "Casual", operational_hours: "12PM to 8PM")
applejack = TattooShop.create(name: "Apple Jack", location: "Manhattan", ambiance: "Cool", operational_hours: "10AM to 9PM")
blackhole = TattooShop.create(name: "Black Hole", location: "Staten Island", ambiance: "Casual", operational_hours: "12PM to 7PM")


jack = Artist.create(name: "Jack", style: "traditional", does_piercings?: true, tattoo_shop: brooklyntattoo)
angela = Artist.create(name: "Angela", style: "black work", does_piercings?: false, tattoo_shop: bctattoo)
dj = Artist.create(name: "DJ", style: "new school", does_piercings?: false, tattoo_shop: gnostic)
omar = Artist.create(name: "Omar", style: "tribal", does_piercings?: false, tattoo_shop: queenstattoo)
tom = Artist.create(name: "Tom", style: "tribal", does_piercings?: true, tattoo_shop: hustleparlor)
charlotte = Artist.create(name: "Charlotte", style: "traditional", does_piercings?: true, tattoo_shop: paintshop)
kim = Artist.create(name: "Kim", style: "black work", does_piercings?: false, tattoo_shop: brooklyntattoo)
oliver = Artist.create(name: "Oliver", style: "new school", does_piercings?: true, tattoo_shop: gnostic)
ramon = Artist.create(name: "Ramon", style: "traditional", does_piercings?: false, tattoo_shop: williamsburger)
cynthia = Artist.create(name: "Cynthia", style: "tribal", does_piercings?: true, tattoo_shop: tortoiseshell)
theodore = Artist.create(name: "Theodore", style: "new school", does_piercings?: true, tattoo_shop: applejack)

appt1 = Appointment.create(date: "September 3, 2020", time: "12PM", description: "Right arm sleeve outline", artist: jack, tattoo_shop: brooklyntattoo, client: joe)
appt2 = Appointment.create(date: "August 31, 2020", time: "3PM", description: "Butterfly on lower back", artist: dj, tattoo_shop: gnostic, client: paulo)
appt3 = Appointment.create(date: "August 27, 2020", time: "4PM", description: "Anchor right forearm", artist: omar, tattoo_shop: queenstattoo, client: thelma)
appt4 = Appointment.create(date: "August 26, 2020", time: "12PM", description: "Right leg sleeve second pass", artist: charlotte, tattoo_shop: paintshop, client: desmond)
appt5 = Appointment.create(date: "September 12, 2020", time: "4PM", description: "Stomach girlfriend's name", artist: kim, tattoo_shop: brooklyntattoo, client: ruby)
appt6 = Appointment.create(date: "September 5, 2020", time: "10AM", description: "Lower left leg soccer ball", artist: theodore, tattoo_shop: applejack, client: sarahlee)
appt7 = Appointment.create(date: "August 30, 2020", time: "6PM", description: "Full back cross and script", artist: omar, tattoo_shop: queenstattoo, client: antonio)
appt8 = Appointment.create(date: "September 3, 2020", time: "5PM", description: "Left bicep barbed wire", artist: cynthia, tattoo_shop: tortoiseshell, client: francis)
appt9 = Appointment.create(date: "September 9, 2020", time: "7PM", description: "Left foot infinity symbol", artist: angela, tattoo_shop: bctattoo, client: ruby)
appt10 = Appointment.create(date: "September 13, 2020", time: "3PM", description: "Right forearm Charizard", artist: oliver, tattoo_shop: gnostic, client: sarah)