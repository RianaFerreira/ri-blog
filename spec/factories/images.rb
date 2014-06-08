# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image, :class => 'Images' do
    url "MyString"
    caption "MyString"
  end
end
