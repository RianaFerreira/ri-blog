# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  caption    :string(255)
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Image < ActiveRecord::Base
  attr_accessible :caption, :url

  belongs_to :post
end
