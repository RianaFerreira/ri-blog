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

require 'spec_helper'

describe Post do
  it 'is invalid without a title' do
    should_not be_valid
  end

  it 'title minimum length is 5 characters' do
    post = Post.new(title: 'Day 2')
    post.title.length.should be >= 5
  end

  it 'is invalid without detail' do
    post = Post.new(title: 'Day 3')
    post.should_not be_valid
  end

  it 'detail minimum length is 20 characters' do
    post = Post.new(title: 'Day 1', detail: 'test the post details being entered')
    post.detail.length.should be > 20
  end

end
