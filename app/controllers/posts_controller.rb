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
    @post = Post.new
  end

  def create
    # render text: params[:post].inspect
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post])
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :detail, :image)
    end

end
