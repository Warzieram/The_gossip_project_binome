# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'


PrivateMessage.destroy_all
TaggedGossip.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

10.times do |index|
  City.create(id: index+1, name: Faker::Address::city)
end




10.times do |index|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  description = Faker::Quote.yoda
  email = Faker::Internet.email
  age = rand(18..100)
  u = User.create(id: index+1, first_name: first_name, last_name: last_name, description: description, email: email, age: age, city_id: index+1)
end




20.times do |index|
  title = Faker::Movie.title
  content = Faker::TvShows::DrWho.quote
  Gossip.create(id: index+1, title: title, content: content, user_id: rand(1..10))
end



10.times do |index|
  Tag.create(id: index+1, title: "##{Faker::Emotion.noun}")
end


20.times do |index|
  gossip = Gossip.find(index+1)
  tag = Tag.find(rand(1..10))
  TaggedGossip.create(id: index+1, gossip_id: gossip.id, tag_id: tag.id)
end



20.times do |index|
  content = Faker::Books::Dune.quote
  PrivateMessage.create(id: index+1, content: content, recipient_id: rand(1..10), sender_id: rand(1..10))
end