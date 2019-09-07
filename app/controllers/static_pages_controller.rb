class StaticPagesController < ApplicationController

  def top
  end
  
  def guest_admin
     flash.now[:success] = 'ゲスト管理者としてログインしました。'
  end
  
  def guest_user
     flash.now[:success] = 'ゲストユーザーとしてログインしました。'
  end
  
end
