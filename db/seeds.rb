Client.destroy_all
Artist.destroy_all 

alex = Client.create(name: "Alex", location: "Bronx")
sarah = Client.create(name:"Sarah", location: "Bronx")

jack = Artist.create(name: "Jack", style: "traditional", does_piercings?: true, tattooshop: brooklyntattoo)
angela = Artist.create(name: "Angela", style: "black work", does_piercings?: false, tattooshop: bctattoo)
dj = Artist.create(name: "DJ", style: "new school", does_piercings?: false, tattooshop: gnostic)
omar = Artist.create(name: "Omar", style: "tribal", does_piercings?: false, tattooshop: queenstatoo)