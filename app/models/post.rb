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

  attr_accessible :title, :detail, :thought, :image, :tags_attributes

  # post validations
  validates :title, presence: true, length: { minimum: 5 }
  validates :detail, presence: true, length: { minimum: 20 }

  # model associations
  has_many :comments, dependent: :destroy
  has_many :tags

  # macro to edit tags via posts with nested attributes
  accepts_nested_attributes_for :tags, allow_destroy: true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  # search query
  def self.search(query)
    if query
      find(:all, :conditions => ['detail LIKE ?', "%#{query}%"])
    else
      find(:all)
    end
  end

end
