puts "Clearing database"
UserService.destroy_all
Service.destroy_all
Event.destroy_all
User.destroy_all
Bid.destroy_all
puts "Cleared"
puts "Seeding...."

chef = Service.create(name: "Chef")
mixologist = Service.create(name: "Mixologist")
waiter = Service.create(name: "Waiter")

test1 = User.new(first_name: "test", last_name:"test", email:"test@test.com", password:"test123", professional: true, bio:"Experienced Chef")
test1.save!
john = User.new(first_name: "John", last_name:"Doe", email:"johndoe@gmail.com", password:"password", professional: true, bio:"Experienced Chef")
john.save!
andrew = User.new(first_name: "Andrew", last_name:"Smith", email:"andrewsmith@gmail.com", password:"password", professional: false, bio:"Looking for chef")
andrew.save!

UserService.create(service_id: chef , user_id: test1)
UserService.create(service_id: waiter , user_id: john)
UserService.create(service_id: mixologist , user_id: andrew)

event1 = Event.create(name:"Birthday Party", date:"2018/12/18", event_type: "birthday", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 3, service_id: chef, min_price: 30, max_price: 50, user_id: andrew.id)
event2 =  Event.create(name:"Leaving Do", date:"2019/03/29", event_type: "party", location:"Manchester", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service_id: chef, min_price: 30, max_price: 50, user_id: andrew.id)
event3 =  Event.create(name:"Casual Dinner", date:"2018/12/19", event_type: "dinner", location:"Liverpool", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service_id: waiter, min_price: 30, max_price: 50, user_id: andrew.id)
event4 =  Event.create(name:"House Warming", date:"2018/12/19", event_type: "party", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service_id: chef, min_price: 30, max_price: 50, user_id: andrew.id)
event5 =  Event.create(name:"Dinner with Friends", date:"2018/12/19", event_type: "dinner", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service_id: mixologist, min_price: 30, max_price: 50, user_id: andrew.id)
event6 =  Event.create(name:"Cocktail Night", date:"2018/12/19", event_type: "party", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service_id: mixologist, min_price: 30, max_price: 50, user_id: andrew.id)
event7 =  Event.create(name:"Birthday Dinner", date:"2018/12/19", event_type: "birthday", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service_id: chef, min_price: 30, max_price: 50, user_id: andrew.id)


bid1 = Bid.new(price: 100, description: "This bid is for birthday event 5 people" , accepted: true ,sku: "1000", user_id: andrew.id, event_id: event1.id)
bid2 = Bid.new(price: 500, description: "This bid is for wedding event 50 people" , accepted: true ,sku: "1000", user_id: john.id, event_id: event2.id)
bid3 = Bid.new(price: 1000, description: "This bid is for hen party event 10 people" , accepted: true ,sku: "1000", user_id: andrew.id, event_id: event3.id)
bid4 = Bid.new(price: 500, description: "This bid is for whatever event 10 people" , accepted: false ,sku: "1000", user_id: john.id, event_id: event4.id)
bid5 = Bid.new(price: 1000, description: "This bid is for whatever 2 event 10 people" , accepted: false ,sku: "1000", user_id: andrew.id, event_id: event5.id)


puts "Seeded"
