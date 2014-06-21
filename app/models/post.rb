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

class Post < ActiveRecord::Base
  # enable elastic search on posts
  searchkick
  paginates_per 20

  attr_accessible :title, :detail, :thought, :tags_attributes, :images_attributes

  # post validations
  validates :title, presence: true, length: { minimum: 5 }
  validates :detail, presence: true, length: { minimum: 20 }
  validates :thought, presence: true, length: { minimum: 10 }

  # model associations
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  # extend the search results to include tags
  def search_data
    attributes.merge(tags: tags)
  end

end
