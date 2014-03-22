# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  detail     :text
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  thought    :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.title {Faker::Lorem.sentence}
    f.detail {Faker::Lorem.paragraph}
    f.thought {Faker::Lorem.sentence}
    f.image "MyString"
  end
end
