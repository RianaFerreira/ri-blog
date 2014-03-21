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

require 'spec_helper'

describe Post do
  it { should allow_mass_assignment_of(:detail) }
  it { should allow_mass_assignment_of(:image) }
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:tags_attributes) }

  it { should_not allow_mass_assignment_of(:id) }
  it { should_not allow_mass_assignment_of(:created_at) }
  it { should_not allow_mass_assignment_of(:updated_at) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:detail) }

  it { should ensure_length_of(:title).is_at_least(5) }
  it { should ensure_length_of(:detail).is_at_least(20) }

  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:tags) }

  it { should accept_nested_attributes_for(:tags).allow_destroy(true) }

end
