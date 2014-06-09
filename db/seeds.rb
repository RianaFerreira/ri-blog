# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
puts "~ Deleting all posts, associated comments and tags"
Post.delete_all
Comment.delete_all
Tag.delete_all
Image.delete_all

puts "~ Creating and populating 20 posts, comments and tags"
10.times do |i|
  @post = Post.create!( title: Faker::Lorem.sentence, detail: Faker::Lorem.paragraph, thought: Faker::Lorem.sentence)
  @post.tags.create!(name: Faker::Lorem.characters(char_count = 10))
  @post.comments.create!(commenter: Faker::Name.name, body: Faker::Lorem.paragraph )
end

puts "~ Database seeded successfully"