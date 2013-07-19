require 'taskrowpresenter'
require 'userpresenter'
require 'commentviewpresenter'

# This entity is a View presenter that takes a
# Task model and converts it to a table row,
# formatted for inclusion in the page.

class TaskRowPresenter

  attr_reader :mode

  def initialize(task)
    @task = task
  end

  def get
    @task
  end

  def comments_count
    @task.comments.count || 0
  end

  def has_comments?
    comments_count > 0
  end

  def assignee
    UserPresenter.new(@task.assignee)
  end

  def reporter
    UserPresenter.new(@task.reporter)
  end

  def status_name
    @task.status.shortname
  end

  def mode=(mode)
    if %i{ add edit }.include? mode
      @mode = mode.to_sym
    end
    @mode
  end
  
  def is_edit_mode?
    @mode == :edit
  end

  # provides a truncated summary of the task description
  def abstract
    @task.description.truncate(75, :separator => /\s/)
  end

  # method missing to delegate to @user or super
  def method_missing(name, *args)
    @task.send(name, *args)
  end

end