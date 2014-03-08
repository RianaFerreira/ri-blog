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

class Comment < ActiveRecord::Base
  attr_accessible :body, :commenter

  validates :body, presence: true, length: { minimum: 20 }
  validates :commenter, presence: true, length: { minimum: 5 }

  belongs_to :post
end
