puts "Clearing database"
UserService.destroy_all
Service.destroy_all
Event.destroy_all
User.destroy_all
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

Event.create(name:"Birthday Party", date:"2018/12/18", event_type: "birthday", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 3, service_id: chef, min_price: 30, max_price: 50, user_id: andrew.id)
3.times do
 Event.create(name:"Leaving Do", date:"2019/03/29", event_type: "party", location:"Manchester", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service_id: chef, min_price: 30, max_price: 50, user_id: andrew.id)
 Event.create(name:"Casual Dinner", date:"2018/12/19", event_type: "dinner", location:"Liverpool", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service_id: waiter, min_price: 30, max_price: 50, user_id: andrew.id)
 Event.create(name:"House Warming", date:"2018/12/19", event_type: "party", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service_id: chef, min_price: 30, max_price: 50, user_id: andrew.id)
 Event.create(name:"Dinner with Friends", date:"2018/12/19", event_type: "dinner", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service_id: mixologist, min_price: 30, max_price: 50, user_id: andrew.id)
 Event.create(name:"Cocktail Night", date:"2018/12/19", event_type: "party", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service_id: mixologist, min_price: 30, max_price: 50, user_id: andrew.id)
 Event.create(name:"Birthday Dinner", date:"2018/12/19", event_type: "birthday", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service_id: chef, min_price: 30, max_price: 50, user_id: andrew.id)
end

puts "Seeded"
