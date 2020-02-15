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
end
