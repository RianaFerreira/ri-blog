class Image < ActiveRecord::Base
  attr_accessible :caption, :url

  belongs_to :post
end
