class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    Post.reindex
    # list all posts for the blog
    @posts = Post.order(:created_at).page params[:page]
    @total_posts = Post.all
    flash[:notice] = "#{view_context.pluralize(@total_posts.count, 'post')} so far."
  end

  def new
    # display form to capture details of new post
    # on submit the form will POST to create action
    @post = Post.new
    flash[:notice] = "Provide information for the blog post."
  end

  def create
    # guard conditions
    @post = Post.new(params[:post])

    if params[:image].present?
       preloaded = Cloudinary::PreloadedFile.new(params[:image])
       # Verify signature by calling preloaded.valid?
       @post.image = preloaded.identifier
    end

    if @post.save
      flash[:notice] = "Post succesfully created."
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # guard conditions
    @post = Post.find(params[:id])

    if params[:image].present?
       preloaded = Cloudinary::PreloadedFile.new(params[:image])
       # Verify signature by calling preloaded.valid?
       @post.image = preloaded.identifier
    end

    if @post.update_attributes(params[:post])
      flash[:notice] = "Post successfully updated."
      redirect_to @post
    else
      flash[:notice] = "Post needs to extra info."
      render :edit
    end
  end

  def destroy
    # guard conditions
    @post = Post.find(params[:id])
    @post.destroy if @post.present?
    flash[:notice] = "Post and linked comments have been removed."
    redirect_to posts_path
  end

  def search
    @results = Post.search(params[:query])

    if @results.present?
      flash[:notice] = "Search returned #{view_context.pluralize(@results.count, 'result')}."
    else
      flash[:notice] = "No posts found that match your search."
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :detail, :thought, :image)
    end

end
