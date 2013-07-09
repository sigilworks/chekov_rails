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

  def stats
    {
      :open => Task.all.where(:status_id => 1).count,
      :need_attention => Task.all.where(:status_id => 3..5).count,
      :closed => Task.all.where(:status_id => 0).count
    }
  end
end
