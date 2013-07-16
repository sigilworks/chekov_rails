
class CommentViewPresenter
  attr_reader :task

  def initialize(comment, task)
    @comment = comment
    @task = task
  end

  def commenter
    UserPresenter.new(@comment.commenter)
  end

  def assignee
    UserPresenter.new(@task.assignee)
  end

  # provides a truncated summary of the task description
  def abstract
    create_abstract(@task.description)
  end

  def comment_date
    # Jul 12, 2013 2:09 PM
  	@comment.created_at.strftime('%b %d, %Y  %I:%M %p')
  end

  # method missing to delegate to @user or super
  def method_missing(name, *args)
    @comment.send(name, *args)
  end


  private

  def create_abstract(text, len=75)
    max_size = len
    text = text || ''
    text = text.gsub(/(\t|\n|\r|\f)/m, '')[0, max_size]
    # not working quite right... maybe need a .chomp! on the end?
    (text.length <= max_size) ? text + '...' : text[0, text.rindex(' ')] + '...';
  end

end