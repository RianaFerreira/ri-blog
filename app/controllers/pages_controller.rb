class PagesController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").first(5)
  end
end