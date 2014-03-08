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
#

class Post < ActiveRecord::Base
  attr_accessible :title, :detail, :image

  validates :title, presence: true, length: { minimum: 5 }
  validates :detail, presence: true, length: { minimum: 20 }

  has_many :comments, dependent: :destroy
end
