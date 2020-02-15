class UsersController < ApplicationController
  def index
    @users=User.all
  end
  def new
  end
  def create
    @user=User.new(name: params[:name], email: params[:email])
    if @user.save
      flash[:notice]="ユーザー登録しました"
      redirect_to("/posts/index")
    else
      flash[:notice]="ユーザー名、メールアドレスを入力してください"
      render("users/new")
    end
  end
  def show
    @user=User.find_by(id: params[:id])
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
    @user.save
    flash[:notice]="アカウントを更新しました"
    redirect_to("/users/index")
  end
  
end
