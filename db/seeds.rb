# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
puts "~ Deleting all posts and associated comments"
Post.delete_all

puts "~ Creating and populating 20 posts and comments"
20.times do |i|
  @post = Post.create!( title: Faker::Lorem.sentence, detail: Faker::Lorem.paragraph )
  @post.comments.create!(commenter: Faker::Name.name, body: Faker::Lorem.paragraph )
end

puts "~ Database seeded successfully"