class PostsController < ApplicationController
  def index
    @posts=Post.all.order(updated_at: :desc)
  end

  def new
  end

  def create
    image=params[:image]
    if image
      @post=Post.new(content: params[:content], user_id: @current_user.id)
      @post.save
      @post.image_name="#{@post.id}.jpg"
      @post.save
      File.binwrite("public/content_image/#{@post.image_name}", image.read)
      redirect_to("/posts/index")
      flash[:notice]="投稿しました"
    else
      flash[:notice]="画像を選択してください"
      render("posts/new")
    end
  end

  def show
    @post=Post.find_by(id: params[:id])
  end
  def destroy
    @post=Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice]="削除しました"
    redirect_to("/posts/index")
  end
  def edit
    @post=Post.find_by(id: params[:id])
  end
  def update
    @post=Post.find_by(id: params[:id])
    @post.content=params[:content]
    @post.save
    flash[:notice]="更新しました"
    redirect_to("/posts/index")
  end


end
