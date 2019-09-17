class TasksController < ApplicationController
  
  
  def index    # タスク一覧
    @user = User.find(params[:user_id]) #認可機能の編集でドライを統一する。
    @tasks = @user.tasks
  end
  
  def new     # タスク新規作成ページ
    @user = User.find(params[:user_id])
    @task = Task.new
  end
end
