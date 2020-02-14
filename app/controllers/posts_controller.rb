class PostsController < ApplicationController
  def index
    @posts=Post.all.order(updated_at: :desc)
  end

  def new
  end

  def create
    @post=Post.new(content: params[:content])
    @post.save
    @post=Post.find_by(id: @post.id)
    @post.image_name="#{@post.id}.jpg"
    @post.save
    image=params[:image]
    File.binwrite("public/content_image/#{@post.image_name}", image.read)
    redirect_to("/posts/index")
  end

  def show
    @post=Post.find_by(id: params[:id])
  end
  def destroy
    @post=Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end
  def edit
    @post=Post.find_by(id: params[:id])
  end
  def update
    @post=Post.find_by(id: params[:id])
    @post.content=params[:content]
    @post.save
    redirect_to("/posts/index")
  end


end
