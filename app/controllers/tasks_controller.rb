class TasksController < ApplicationController
  
  
  def index    # タスク一覧
    @user = User.find(params[:user_id]) #認可機能の編集でドライを統一する。
    @tasks = @user.tasks
  end
  
  def new     # タスク新規作成ページ
    @user = User.find(params[:user_id])
    @task = Task.new
  end
  
  def create   #タスク作成→タスク一覧へ
    @user = User.find(params[:user_id])
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
  end
  
    private

    def task_params
      params.require(:task).permit(:name, :description)
    end
end
