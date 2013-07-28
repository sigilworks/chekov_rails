
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
    binding.pry
    if [ :add, :edit ].include? mode
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