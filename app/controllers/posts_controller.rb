class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    Post.reindex
    @posts = Post.order("created_at DESC").page params[:page]
    @total_posts = Post.all
    flash[:notice] = "#{view_context.pluralize(@total_posts.count, 'post')} so far."
  end

  def new
    @post = Post.new
    setup_post
    flash[:notice] = "Provide information for the blog post."
  end

  def create
    @post = Post.new(params[:post])

    if @post.images.present?
     preloaded = Cloudinary::PreloadedFile.new(@post.images.first.url)
     raise "Invalid upload signature" unless preloaded.valid?
     @post.images.first.url = preloaded.identifier
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
    @post = Post.find(params[:id])

    if @post.images.present?
      Cloudinary::Uploader.destroy(@post.images.first.url) unless @post.images.first.url.nil?
      preloaded = Cloudinary::PreloadedFile.new(params[:post][:images_attributes]["0"][:url])
      raise "Invalid upload signature" unless preloaded.valid?
      params[:post][:images_attributes]["0"][:url] = preloaded.identifier
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
    @post = Post.find(params[:id])

    @post.images.each do |img|
      Cloudinary::Uploader.destroy(img.url) unless img.url.nil?
    end

    if @post.destroy
      flash[:notice] = "Post and linked comments have been removed."
    end

    redirect_to posts_path
  end

  def search
    @results = Post.search params[:query], order: {created_at: :desc}

    if @results.present?
      flash[:notice] = "Search returned #{view_context.pluralize(@results.count, 'result')}."
    else
      flash[:notice] = "No posts found that match your search."
    end
  end

  private
    def setup_post
      @post.tags.build
      @post.images.build
    end
end
