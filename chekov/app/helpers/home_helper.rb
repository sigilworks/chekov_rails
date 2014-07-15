
module HomeHelper

  def app_version
    Version.first.name
  end

  def me
    UserPresenter.new(@user)
  end

  def current_user
    UserPresenter.new(@user)
  end

  def task_list
    @tasks.map { |task| TaskRowPresenter.new(task) }
  end

  def assignee_list
    @assignee_list.map { |assignee| UserPresenter.new(assignee) }
  end

  def login_user_list
    @user_list.map { |user| UserPresenter.new(user) }
  end

  def new_task
    task = Task.new
    task.reporter = @user
    task.status = Status.NEW
    task.assignee = User.nobody
    EditTaskPresenter.new(:add, task)
  end

  def edit_task(task_id)
    EditTaskPresenter.new(Task.find(task_id))
  end

  # provides presenter for one particular comment of a task
  def comment_for_task(taskid)
    task = Task.find(taskid)
    comment = Comment.new
    comment.commenter = @user
    CommentViewPresenter.new(comment, task)
  end

  # provides listing of all comments for a task
  def comments_for_task(taskid)
    task = Task.find(taskid)

    comments = task.comments.map do |comment|
      CommentViewPresenter.new(comment, task)
    end

    Struct.new(:task, :comments).new(TaskRowPresenter.new(task), comments)
  end

end
