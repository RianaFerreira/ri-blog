# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  commenter  :string(255)
#  body       :text
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    commenter "MyString"
    body "MyText"
    post nil
  end
end
