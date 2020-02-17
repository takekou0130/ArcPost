class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def new
  end

  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/posts/index")
  end

  def login_form
  end

  def login
    @user=User.find_by(email: params[:email], password: params[:password])
    if @user
      flash[:notice]="ログインしました"
      session[:user_id]=@user.id
      redirect_to("/posts/index")
    else
      flash[:notice]="メールアドレスまたはパスワードが間違っています"
      @email=params[:email]
      @password=params[:password]
      render("users/login_form")
    end
  end

  def create
    @user=User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      if params[:image] #アイコン画像が選択された場合のみ変更
        image=params[:image]
        @user.image_name="#{@user.id}.jpg"
        @user.save
        File.binwrite("public/user_image/#{@user.image_name}", image.read)
      end
      flash[:notice]="ユーザー登録しました"
      redirect_to("/posts/index")
    else
      flash[:notice]="ユーザー名、メールアドレス、パスワードを入力してください"
      render("users/new")
    end
  end

  def show
    @user=User.find_by(id: params[:id])
    @posts=Post.where(user_id: params[:id]).order(updated_at: :desc)
  end

  def destroy
    @user=User.find_by(id: params[:id])
    @user.destroy
    flash[:notice]="アカウントを削除しました"
    redirect_to("/users/index")
  end

  def edit
    @user=User.find_by(id: params[:id])
  end

  def update
    @user=User.find_by(id: params[:id])
    @user.name=params[:name]
    @user.email=params[:email]
    if params[:image] #アイコン画像が選択された場合のみ変更
      image=params[:image]
      @user.image_name="#{@user.id}.jpg"
      File.binwrite("public/user_image/#{@user.image_name}", image.read)
    end
    @user.save
    flash[:notice]="アカウントを更新しました"
    redirect_to("/users/index")
  end
  
end
