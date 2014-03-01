class PagesController < ApplicationController
  def index
    @posts = Post.first(5)
  end
end