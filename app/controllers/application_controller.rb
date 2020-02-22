class ApplicationController < ActionController::Base
before_action :get_current_user

    # ログインしているユーザーの取得
    def get_current_user
        @current_user=User.find_by(id: session[:user_id])
    end
    # ログインしていない時のアクセス制限
    def authenticate_user
        if @current_user==nil
            flash[:notice]="ログインしてください"
            redirect_to("/login")
        end
    end
    # ログインしている時のアクセス制限
    def forbid_login_user
        if @current_user
            flash[:notice]="ログイン済です"
            redirect_to("/posts/index")
        end
    end
    
    # 他のユーザーへのアクセス制限

end
