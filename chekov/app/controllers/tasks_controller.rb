class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks(.json)
  def index
    @tasks = Task.all
  end

  # GET /tasks/1(.json)
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new(task_params)
    @app_list = Application.all
    render :partial => "partials/new_task_view",
           :locals => { :task => EditTaskPresenter.new(:add, @task) }
  end

  # GET /tasks/1/edit
  def edit
    @app_list = Application.all
    @status_list = Status.all
    @assignee_list = User.assignees
    render :partial => "partials/new_task_view",
           :locals => { :task => EditTaskPresenter.new(:edit, @task) }
  end

  # POST /tasks(.json)
  def create
    @task = Task.new(task_params)
    @task.assignee = User.nobody
    @user = current_user

    if @task.save
      render :partial => 'partials/task_row_view',
             :locals => { :task => TaskRowPresenter.new(@task), :me => UserPresenter.new(@user) }
    else
      render json: @task.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /tasks/1(.json)
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1(.json)
  def destroy
    @task.destroy
    respond_to do |format|
      #format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.permit(:task, :application_id, :build_observed, :description, :bz_id, :reporter_id, :assignee_id, :status_id, :browser_id, :id)
    end
end
