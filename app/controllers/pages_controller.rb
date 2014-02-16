class PagesController < ApplicationController
  def index
    @posts = Post.first(10)
  end
end