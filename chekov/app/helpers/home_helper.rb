require 'userpresenter'
require 'taskrowpresenter'
require 'edittaskpresenter'

module HomeHelper

  def me
    UserPresenter.new(@user)
  end

  def tasklist
    @tasks.map { |task| TaskRowPresenter.new(task) }
  end

  def edit_task(task_id)
  	EditTaskPresenter.new(Task.find(task_id))
  end

end
