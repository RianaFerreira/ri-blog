# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 5.times do |i|
#   Post.create(title: "#{Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 6)}",
#               detail: "#{Faker::Lorem.sentence(paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3))}")
# end  
require 'faker'

20.times do |i|
  Post.create!(title: Faker::Lorem.sentence, detail: Faker::Lorem.paragraph )
end