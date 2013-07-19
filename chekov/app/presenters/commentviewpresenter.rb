require 'taskrowpresenter'

class CommentViewPresenter
  include ActionView::Helpers::DateHelper

  attr_reader :task

  def initialize(comment, task)
    @comment = comment
    @task = TaskRowPresenter.new(task)
  end

  def commenter
    UserPresenter.new(@comment.commenter)
  end

  def assignee
    UserPresenter.new(@task.assignee)
  end

  def comment_date
    # Jul 12, 2013 2:09 PM
  	# @comment.created_at.strftime('%b %d, %Y  %I:%M %p')
    distance_of_time_in_words_to_now(@comment.created_at, :include_seconds => true) 
  end

  # method missing to delegate to @user or super
  def method_missing(name, *args)
    @comment.send(name, *args)
  end

end