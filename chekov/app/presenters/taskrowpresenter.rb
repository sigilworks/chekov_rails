require 'taskrowpresenter'
require 'userpresenter'

# This entity is a View DTO that takes a
# Task model and converts it to a table row,
# formatted for direct inclusion in the page.

class TaskRowPresenter

  def initialize(task)
    @task = task
  end

  def comments_count
    @task.comments.count
  end

  def assignee
    UserPresenter.new(@task.assignee)
  end

  def reporter
    UserPresenter.new(@task.reporter)
  end

  def status_class
    @task.status.shortname
  end

  # method missing to delegate to @user or super
  def method_missing(name, *args)
    @task.send(name, *args)
  end

end