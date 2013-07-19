require 'userpresenter'
require 'taskrowpresenter'
require 'edittaskpresenter'
require 'commentviewpresenter'

module HomeHelper

  def app_version
    Version.first.name
  end

  def me
    UserPresenter.new(@user)
  end

  def tasklist
    @tasks.map { |task| TaskRowPresenter.new(task) }
  end

  def new_task
    task = Task.new
    task.reporter = @user
    TaskRowPresenter.new(task)
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

  def stats
    { :open => Task.all.where(:status_id => 2).count,
      :need_attention => Task.all.where(:status_id => 4..6).count,
      :closed => Task.all.where(:status_id => 1).count }
  end
end
