class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # ログイン済みのユーザーか確認します(E1)
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end
  
  # アクセスしたユーザーが現在ログインしているユーザーか確認します(E3)。
  def correct_user
    redirect_to root_url unless current_user?(@user)
  end

  # システム管理権限所有かどうか判定します(E2)。
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
  
  # 管理権限者、または現在ログインしているユーザーを許可します(E4)。
  def admin_or_correct
    unless current_user?(@user) || current_user.admin?
      flash[:danger] = "権限がありません。"
      redirect_to root_url
    end  
  end
end
