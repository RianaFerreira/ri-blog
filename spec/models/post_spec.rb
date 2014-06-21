# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  detail     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  thought    :string(255)
#

require 'spec_helper'

describe Post do
  # test model associations and validations
  it { should allow_mass_assignment_of(:detail) }
  it { should allow_mass_assignment_of(:image) }
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:thought) }
  it { should allow_mass_assignment_of(:tags_attributes) }

  it { should_not allow_mass_assignment_of(:id) }
  it { should_not allow_mass_assignment_of(:created_at) }
  it { should_not allow_mass_assignment_of(:updated_at) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:detail) }
  it { should validate_presence_of(:thought) }

  it { should ensure_length_of(:title).is_at_least(5) }
  it { should ensure_length_of(:detail).is_at_least(20) }
  it { should ensure_length_of(:thought).is_at_least(10) }

  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:tags) }

  it { should accept_nested_attributes_for(:tags).allow_destroy(true) }

  # test model attributes with factory objects
  it 'has a valid factory' do
    FactoryGirl.create(:post).should be_valid
  end

  it 'is invalid without a title' do
    FactoryGirl.build(:post, title: nil).should_not be_valid
  end

  it 'is invalid without detail' do
    FactoryGirl.build(:post, detail: nil).should_not be_valid
  end

  it 'is invalid without a thought' do
    FactoryGirl.build(:post, thought: nil).should_not be_valid
  end

  # test model behaviour with factory objects
  xit 'returns a hash of post results that match' do
    title = Factory(:post, title: "Testing")
    detail = Factory(:post, detail: "Testing model specification detail here")
    thought = Factory(:post, thought: "Testing testing")

    Post.search("test").should == {}
  end

end
