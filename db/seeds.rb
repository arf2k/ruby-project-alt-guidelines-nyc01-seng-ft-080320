Client.destroy_all
Artist.destroy_all 

alex = Client.create(name: "Alex", location: "Bronx")
sarah = Client.create(name:"Sarah", location: "Bronx")

sarah = Client.create(name:"Sarah", location: "Brooklyn")
joe = Client.create(name:"Joe", location: "Queens")

brooklyntattoo = TattooShop.create(name: "Brooklyn Tattoo", location: "Brooklyn", average_review: 4, ambiance: "Casual", operational_hours: "10AM to 8PM", does_piercings?: True, recommended?: True)   )
bctatto = TattooShop.create(name: "B.C. Tattoo", location: "Manhattan")
gnostic = TattooShop.create(name: "Gnostic")




jack = Artist.create(name: "Jack", style: "traditional", does_piercings?: true, tattooshop: brooklyntattoo)
angela = Artist.create(name: "Angela", style: "black work", does_piercings?: false, tattooshop: bctattoo)
dj = Artist.create(name: "DJ", style: "new school", does_piercings?: false, tattooshop: gnostic)
omar = Artist.create(name: "Omar", style: "tribal", does_piercings?: false, tattooshop: queenstatoo)
