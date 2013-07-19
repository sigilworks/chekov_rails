require 'userpresenter'
require 'browserlistpresenter'

# application_id: 1,
# build_observed: "b16",
# description: "You gotta fix that thing on the part that's broken...ok?",
# bz_id: 12345,
# reporter_id: 2,
# assignee_id: 2,
# status_id: 2,
# browser_id: 14,
# created_at: "2013-07-03T12:02:00.884Z",
# updated_at: "2013-07-08T14:15:27.049Z"

# App: RO
# Build:
# Status: CLOSED
# Browser: <BrowserList>
# BZ id:
# Reporter: Palmer, T.
# Assignee: Palmer, T.
# Description: qwerty...


class EditTaskPresenter

  attr_reader :mode 

  def initialize(mode = :edit, task)
    @task = task or Task.new
    @browser_list = BrowserListPresenter.new
    @mode = mode
  end

  def browsers
    @browser_list
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
    @task.status.name.upcase
  end

  def status_name
    @task.status.name.downcase
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

  # method missing to delegate to @user or super
  def method_missing(name, *args)
    @task.send(name, *args)
  end

end