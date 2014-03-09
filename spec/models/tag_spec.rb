# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Tag do
  it { should allow_mass_assignment_on(:name) }
  it { should allow_mass_assignment_on(:tags_attributes) }
end
