puts "Clearing database"
Review.destroy_all
Order.destroy_all
UserService.destroy_all
Service.destroy_all
Event.destroy_all
Bid.destroy_all
User.destroy_all
puts "Cleared"
puts "Seeding...."

chef = Service.create!(name: "Chef")
mixologist = Service.create!(name: "Mixologist")
waiter = Service.create!(name: "Waiter")

louise = User.create!(first_name: "Louise", last_name:"Jones", email:"louise@gmail.com", password:"password", professional: true, bio:"Experienced Chef", remote_photo_url: "https://randomuser.me/api/portraits/women/89.jpg")
john = User.create!(first_name: "John", last_name:"Miles", email:"johnmiles@gmail.com", password:"password", professional: true, bio:"Experienced Waiter", remote_photo_url: "https://randomuser.me/api/portraits/men/97.jpg")
andrew = User.create!(first_name: "Andrew", last_name:"Smith", email:"andrewsmith@gmail.com", password:"password", professional: true, bio:"Experienced Mixologist", remote_photo_url: "https://randomuser.me/api/portraits/men/43.jpg")
lisa = User.create!(first_name: "Lisa", last_name:"Cooper", email:"lisa@gmail.com", password:"password", professional: false, bio:"", remote_photo_url: "https://randomuser.me/api/portraits/women/63.jpg")
rob = User.create!(first_name: "Rob", last_name:"Forbs", email:"rob@gmail.com", password:"password", professional: false, bio:"", remote_photo_url: "https://randomuser.me/api/portraits/men/78.jpg")
steve = User.create!(first_name: "Steve", last_name:"Jenkins", email:"steve@gmail.com", password:"password", professional: false, bio:"", remote_photo_url: "https://randomuser.me/api/portraits/men/18.jpg")
meghan = User.create!(first_name: "Meghan", last_name:"Wiseman", email:"meghan@gmail.com", password:"password", professional: false, bio:"", remote_photo_url: "https://randomuser.me/api/portraits/women/57.jpg")
julia = User.create!(first_name: "Julia", last_name:"Hawkins", email:"julia@gmail.com", password:"password", professional: false, bio:"", remote_photo_url: "https://randomuser.me/api/portraits/women/79.jpg")
irene = User.create!(first_name: "Irene", last_name:"Mendez", email:"irene@gmail.com", password:"password", professional: false, bio:"", remote_photo_url: "https://randomuser.me/api/portraits/women/71.jpg")
james = User.create!(first_name: "James", last_name:"Ward", email:"james@gmail.com", password:"password", professional: false, bio:"", remote_photo_url: "https://randomuser.me/api/portraits/men/36.jpg")
jack = User.create!(first_name: "Jack", last_name:"Styles", email:"jack@gmail.com", password:"password", professional: false, bio:"", remote_photo_url: "https://randomuser.me/api/portraits/men/58.jpg")




UserService.create!(service: chef , user: louise)
UserService.create!(service: chef , user: lisa)
UserService.create!(service: chef , user: steve)
UserService.create!(service: waiter , user: john)
UserService.create!(service: mixologist , user: andrew)

event1 = Event.create!(name:"Birthday Party (kids party)", date:"2018/12/18", event_type: "birthday", location:"London", description:"Hosting a party for my 5 year old daughter I need a chef to prepare simple, healthy fun finger food for small kids and adults ", party_size: 20, service: chef, min_price: 150, max_price: 250, user_id: andrew.id)
event2 =  Event.create!(name:"Leaving Do", date:"2019/01/10", event_type: "work party", location:"Manchester", description:"The time has come to finally leave Manchester. Yes it is short notice but I'm hosting a leaving party for myself.  What time, 7ish", party_size: 20, service: chef, min_price: 100, max_price: 200, user_id: andrew.id)
event3 =  Event.create!(name:"Casual Dinner", date:"2018/12/18", event_type: "dinner", location:"Liverpool", description:"party", party_size: 40, service: waiter, min_price: 100, max_price: 150, user_id: andrew.id)
event4 =  Event.create!(name:"House Warming", date:"2018/12/17", event_type: "house party", location:"London", description:"I'm hosting a house warming party, I'm looking for a chef who is professional and experienced. The kitchen is large with plenty of space and all amenities will be provided. I'm hoping to host a main dinner and a dessert and I'm open to suggestions ", party_size: 12, service: chef, min_price: 400, max_price: 500, user_id: john.id)
event5 =  Event.create!(name:"Dinner with Friends", date:"2018/12/16", event_type: "dinner", location:"London", description:"I'm hosting a dinner party, I'm looking for a chef who is professional and experienced. The kitchen is of a medium size but should be sufficient and all amenities will be provided. I'm hoping to host a main dinner and a dessert however, I'm open to suggestions", party_size: 10, service: chef, min_price: 200, max_price: 250, user_id: lisa.id)
event6 =  Event.create!(name:"Cocktail Night", date:"2018/12/15", event_type: "cocktail party", location:"London", description:"I'm looking for a mixologist for my event, I'll need an experienced and proffessional individual who knows how to make a good classic cocktials", party_size: 10, service: mixologist, min_price: 150, max_price: 500, user_id: andrew.id)
event7 =  Event.create!(name:"Birthday Dinner", date:"2018/01/19", event_type: "birthday", location:"London", description:"I would like a chef to help me host my birthday party event which will be held in my house, I would like morrocan style food, I can provide everything although I would like the chef to source the food and I will pay this in addition to the price quoted", party_size: 10, service: chef, min_price: 200, max_price: 300, user_id: andrew.id)
event8 =  Event.create!(name:"Brunch", date:"2018/01/26", event_type: "Brunch", location:"London", description:"I'm hosting a brunch party, I'm looking for a chef who is professional and experience. The kitchen is large with plenty of space and all amenities will be provided. I'm hoping to have the classic avo with poached eggs, eggs benedict etc, dessert would also be nice but I'm open to suggestions", party_size: 10, service: chef, min_price: 200, max_price: 400, user_id: lisa.id)
event9 =  Event.create!(name:"Small wedding party", date:"2018/01/26", event_type: "wedding", location:"London", description:"I'm hosting a very low key wedding party, I'm looking for a chef who is professional and experienced. The kitchen is large with plenty of space and all amenities will be provided. I'm hoping to provide a 3 course meal plus dessert and I'm open to suggestions", party_size: 20, service: chef, min_price: 350, max_price: 500, user_id: lisa.id)
event10 =  Event.create!(name:"Birthday party", date:"2018/12/29", event_type: "party", location:"London", description:"I need a chef for my partner's 30th birthday party, I'm interested in experienced and professional chefs", party_size: 17, service: chef, min_price: 100, max_price: 250, user_id: andrew.id)
event12 =  Event.create!(name:"Reunion Dinner", date:"2018/12/05", event_type: "Dinner", location:"London", description:"I'm hosting a dinner party, I'm looking for a chef who is professional and experienced. The kitchen is large with plenty of space and all amenities will be provided. I'm hoping to host a main dinner and a dessert and I'm open to suggestions ", party_size: 10, service: chef, min_price: 250, max_price: 400, user_id: louise.id)
event13 =  Event.create!(name:"30th Birthday!", date:"2018/12/19", event_type: "birthday", location:"London", description:"I'm looking for a mixologist who is professional and experienced, I'm keen on drinks such as artisan gin and tonics, old fashioned and margaritas ", party_size: 13, service: mixologist, min_price: 150, max_price: 250, user_id: andrew.id)
event14 =  Event.create!(name:"Fred's Farewell", date:"2018/12/17", event_type: "family event", location:"London", description:"I'm hosting a farewell party, I'm looking for a chef who is professional and experienced. The kitchen is large with plenty of space and all amenities will be provided. I'm hoping to host a main dinner and a dessert and I'm open to suggestions", party_size: 10, service: chef, min_price: 150, max_price: 300, user_id: andrew.id)
event15 =  Event.create!(name:"Welcome Home party", date:"2019/12/10", event_type: "family event", location:"London", description:"I'm hosting a welcome home party, I'm looking for a chef who is professional and experienced. The kitchen is large with plenty of space and all amenities will be provided. I'm hoping to host a main dinner and a dessert and I'm open to suggestions", party_size: 20, service: chef, min_price: 240, max_price: 300, user_id: louise.id)
event16 =  Event.create!(name:"Fashion blogger Event", date:"2019/12/05", event_type: "business event", location:"London", description:"I'm hosting a small corperate event, I'm looking for a chef who is professional and experienced. The event space is large with plenty of space and all amenities will be provided. I'm hoping to host a main dinner and a dessert and I'm open to suggestions ", party_size: 60, service: chef, min_price: 350, max_price: 400, user_id: lisa.id)
event17 =  Event.create!(name:"Launch party", date:"2019/12/01", event_type: "launch party", location:"London", description:"I'm hosting a small corperate event, I'm looking for a chef who is professional and experienced. The event space is large with plenty of space and all amenities will be provided. I'm hoping to host a main dinner and a dessert and I'm open to suggestions ", party_size: 40, service: chef, min_price: 200, max_price: 300, user_id: andrew.id)
event18 =  Event.create!(name:"Sweet 16", date:"2019/12/20", event_type: "party", location:"London", description:"I'm open to suggestions", party_size: 16, service: chef, min_price: 225, max_price: 300, user_id: louise.id)
event19 =  Event.create!(name:"New Years Eve Party", date:"2018/12/31", event_type: "new years", location:"London", description:"I'm looking for a mixologist who is professional and experienced, I'm keen on drinks such as artisan whisky, old fashioned and margaritas", party_size: 50, service: mixologist, min_price: 150, max_price: 300, user_id: andrew.id)
event20 =  Event.create!(name:"Engagement Party", date:"2019/09/01", event_type: "Engagement", location:"London", description:"I'm looking for a mixologist who is professional and experienced, I'm keen on drinks such as vintage wines, old fashioned and margaritas cocktails", party_size: 50, service: mixologist, min_price: 260, max_price: 350, user_id: john.id)
event21 =  Event.create!(name:"Baby shower", date:"2019/11/17", event_type: "summer", location:"London", description:"I need a waiter/waitress who is able to help out serving food at my party of 50 people, the event should last between 2 - 4 hours", party_size: 50, service: waiter, min_price: 100, max_price: 150, user_id: lisa.id)
event22 =  Event.create!(name:"Summer Party", date:"2019/08/17", event_type: "party", location:"London", description:"I'm hosting a summer party, I'm looking for a chef who is professional and experienced. The kitchen is large with plenty of space and all amenities will be provided. I'm hoping to provide great bbq style food and I'm open to suggestions ", party_size: 50, service: chef, min_price: 150, max_price: 200, user_id: andrew.id)
event23 =  Event.create!(name:"Tea party", date:"2019/07/08", event_type: "tea party", location:"London", description:"I'm hosting a tea party, I'm looking for a chef who is professional and experienced. The kitchen is of a medium size but should be sufficient and all amenities will be provided", party_size: 50, service: chef, min_price: 200, max_price: 300, user_id: andrew.id)




bid1 = Bid.create!(quote: 200, description: "This bid is for birthday event 5 people" , status: "accepted", sku: chef.name, user_id: louise.id, event_id: event1.id, price_cents: 100)
bid2 = Bid.create!(quote: 500, description: "This bid is for wedding event" , status: "accepted", sku: chef.name, user_id: louise.id, event_id: event9.id, price_cents: 100)
bid3 = Bid.create!(quote: 1000, description: "This bid is for hen party event 10 people" ,status: "accepted", sku: waiter.name, user_id: john.id, event_id: event3.id, price_cents: 100)
bid4 = Bid.create!(quote: 500, description: "This bid is for whatever event 10 people" , sku: mixologist.name, user_id: john.id, event_id: event4.id, price_cents: 100)
bid5 = Bid.create!(quote: 1000, description: "This bid is for whatever 2 event 10 people" , sku: mixologist.name, user_id: louise.id, event_id: event10.id, price_cents: 100)
bid6 = Bid.create!(quote: 600, description: "This bid is for birthday event 5 people" , status: "accepted", sku: chef.name, user_id: john.id, event_id: event22.id, price_cents: 100)
bid7 = Bid.create!(quote: 850, description: "This bid is for birthday event 5 people" , status: "accepted", sku: chef.name, user_id: john.id, event_id: event23.id, price_cents: 100)
bid8 = Bid.create!(quote: 1000, description: "This bid is for whatever 2 event 10 people" , status: "declined", sku: mixologist.name, user_id: john.id, event_id: event19.id, price_cents: 100)
bid9 = Bid.create!(quote: 250, description: "This bid is for wedding event 50 people" , status: "accepted", sku: chef.name, user_id: john.id, event_id: event18.id, price_cents: 100)
bid10 = Bid.create!(quote: 930, description: "This bid is for wedding event 50 people" , status: "declined", sku: chef.name, user_id: andrew.id, event_id: event16.id, price_cents: 100)
bid11 = Bid.create!(quote: 650, description: "This bid is for wedding event 50 people" , status: "accepted", sku: chef.name, user_id: john.id, event_id: event17.id, price_cents: 100)



puts "Seeded"

