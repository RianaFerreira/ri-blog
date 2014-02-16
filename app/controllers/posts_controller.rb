class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    # list all posts for the blog
    @posts = Post.all
  end

  def new
    # display form to capture details of new post
    # on submit the form will POST to create action
  end

  def create
    # render text: params[:post].inspect
    @post = Post.new(params[:post])
    @post.save
    redirect_to @post
  end
end
