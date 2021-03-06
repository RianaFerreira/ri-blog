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

class Post < ActiveRecord::Base
  # enable elastic search on posts
  searchkick
  paginates_per 20

  attr_accessible :title, :detail, :thought, :image, :tags_attributes

  # post validations
  validates :title, presence: true, length: { minimum: 5 }
  validates :detail, presence: true, length: { minimum: 20 }
  validates :thought, presence: true, length: { minimum: 10 }

  # model associations
  has_many :comments, dependent: :destroy
  has_many :tags

  # macro to edit tags via posts with nested attributes
  accepts_nested_attributes_for :tags, allow_destroy: true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  # extend the search results to include tags
  def search_data
    attributes.merge(tags: tags)
  end

  # kicksearch methods replace this search logic
  # # search query
  # def self.search(query)
  #   if query
  #     find(:all, :conditions => ['detail LIKE ? OR title LIKE ?', "%#{query}%", "%#{query}%"])
  #   else
  #     find(:all)
  #   end
  # end

end
