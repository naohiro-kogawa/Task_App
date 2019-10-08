class TasksController < ApplicationController
  before_action :set_task, only: %i(show edit update destroy)
  before_action :logged_in_user
  # before_action :correct_user
  
  
  def index    # タスク一覧
    @user = User.find(params[:user_id]) #認可機能の編集でドライを統一する。
    @tasks = @user.tasks
  end
  
  def show
    @user = User.find(params[:user_id])
    @task = @user.tasks.find_by(id: params[:id])
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
  
  def edit  # タスクの編集
    @user = User.find(params[:user_id])
    @task = @user.tasks.find_by(id: params[:id])
  end
  
  def update  #　タスクの更新
      @user = User.find(params[:user_id])
      @task = @user.tasks.find_by(id: params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url(@user, @task)
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @task = @user.tasks.find_by(id: params[:id])
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url @user
  end  
  
    private

    def task_params
      params.require(:task).permit(:name, :description)
    end
    
    
    def set_task
      @user = User.find(params[:user_id])
      unless @task = @user.tasks.find_by(id: params[:id])
        flash[:danger] = "権限がありません。"
        redirect_to user_tasks_url @user
      end
    end    
end
