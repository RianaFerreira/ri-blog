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

require 'spec_helper'

describe Comment do
  it { should allow_mass_assignment_of(:body) }
  it { should allow_mass_assignment_of(:commenter) }

  it { should_not allow_mass_assignment_of(:id) }
  it { should_not allow_mass_assignment_of(:created_at) }
  it { should_not allow_mass_assignment_of(:updated_at) }

  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:commenter) }

  it { should ensure_length_of(:body).is_at_least(20) }
  it { should ensure_length_of(:commenter).is_at_least(2) }

  it { should belong_to(:post) }
end
