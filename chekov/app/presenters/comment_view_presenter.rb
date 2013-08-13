
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
    return UserPresenter.new(@task.assignee) if !@task.assignee.is_nobody?
    UserPresenter.new(User.nobody) # i.e., it's assigned to user Nobody
  end

  def comment_date
    # Jul 12, 2013 2:09 PM
  	@comment.created_at.strftime("#{ AppConfig.datetime.med }")
  end

  def comment_date_in_words
    time_ago_in_words(@comment.created_at, :include_seconds => true)
  end

  # method missing to delegate to @user or super
  def method_missing(name, *args, &block)
    @comment.send(name, *args, &block)
  end

end