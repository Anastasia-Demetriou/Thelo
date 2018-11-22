puts "Clearing database"
UserService.destroy_all
Service.destroy_all
Event.destroy_all
User.destroy_all
Bid.destroy_all
puts "Cleared"
puts "Seeding...."

chef = Service.create!(name: "Chef")
mixologist = Service.create!(name: "Mixologist")
waiter = Service.create!(name: "Waiter")

test1 = User.create!(first_name: "test", last_name:"test", email:"test11@test.com", password:"test123", professional: true, bio:"Experienced Chef")
john = User.create!(first_name: "John", last_name:"Doe", email:"johndoe@gmail.com", password:"password", professional: true, bio:"Experienced Chef")
andrew = User.create!(first_name: "Andrew", last_name:"Smith", email:"andrewsmith@gmail.com", password:"password", professional: false, bio:"Looking for chef")

UserService.create!(service: chef , user: test1)
UserService.create!(service: waiter , user: john)
UserService.create!(service: mixologist , user: andrew)

event1 = Event.create!(name:"Birthday Party", date:"2018/12/18", event_type: "birthday", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 3, service: chef, min_price: 30, max_price: 50, user_id: andrew.id)
event2 =  Event.create!(name:"Leaving Do", date:"2019/03/29", event_type: "party", location:"Manchester", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service: chef, min_price: 10, max_price: 20, user_id: andrew.id)
event3 =  Event.create!(name:"Casual Dinner", date:"2018/12/19", event_type: "dinner", location:"Liverpool", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service: waiter, min_price: 100, max_price: 150, user_id: andrew.id)
event4 =  Event.create!(name:"House Warming", date:"2018/12/19", event_type: "party", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service: chef, min_price: 50, max_price: 70, user_id: andrew.id)
event5 =  Event.create!(name:"Dinner with Friends", date:"2018/12/19", event_type: "dinner", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service: mixologist, min_price: 80, max_price: 110, user_id: andrew.id)
event6 =  Event.create!(name:"Cocktail Night", date:"2018/12/19", event_type: "party", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service: mixologist, min_price: 1000, max_price: 1500, user_id: andrew.id)
event7 =  Event.create!(name:"Birthday Dinner", date:"2018/12/19", event_type: "birthday", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service: chef, min_price: 1, max_price: 5, user_id: andrew.id)

bid1 = Bid.create!(quote: 100, description: "This bid is for birthday event 5 people" , sku: chef.name, user_id: andrew.id, event_id: event1.id, price_cents: 100)
bid2 = Bid.create!(quote: 500, description: "This bid is for wedding event 50 people" , sku: chef.name, user_id: john.id, event_id: event2.id, price_cents: 100)
bid3 = Bid.create!(quote: 1000, description: "This bid is for hen party event 10 people" , sku: waiter.name, user_id: andrew.id, event_id: event3.id, price_cents: 100)
bid4 = Bid.create!(quote: 500, description: "This bid is for whatever event 10 people" , sku: mixologist.name, user_id: john.id, event_id: event4.id, price_cents: 100)
bid5 = Bid.create!(quote: 1000, description: "This bid is for whatever 2 event 10 people" , sku: mixologist.name, user_id: andrew.id, event_id: event5.id, price_cents: 100)



puts "Seeded"

