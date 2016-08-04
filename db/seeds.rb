# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Vote.destroy_all
Visit.destroy_all
Group.destroy_all
Restaurant.destroy_all
GroupUser.destroy_all


names = ["Sam", "Juan", "Chris", "Rosa"]
names.each do |name|
user = User.create(username: name, email: "#{name}@#{name}.com".downcase, password: "password")
end

puts "Users created."
puts ""


4.times do
  group = Group.create(
    name: Faker::Pokemon.name,
    location: Faker::Pokemon.location,
    vote_status: "Active")
  2.times do
    Restaurant.create(
    location: Faker::Address.street_address,
    name: Faker::Company.name,
    group_id: group.id
    )
  end
end

puts "Groups and Restaurants created."
puts ""

groups = Group.all
groups.each do |group|
  users = User.all.sample(2)
  GroupUser.create(
    group_id: group.id,
    user_id: users[0].id
    )
  GroupUser.create(
    group_id: group.id,
    user_id: users[1].id
    )
end
puts "Users addded to Groups."
puts ""

users = User.all
users.each do |user|

end

users = User.all
users.each do |user|
  groups = user.groups
  groups.each do |group|
    restaurant = group.restaurants.sample(1)
  Vote.create(
  user_id: user.id,
  restaurant_id: restaurant[0].id,
  group_id: group.id
  )
  puts user.id
  puts restaurant[0].id
  end
end
puts "Users voted."
puts ""

