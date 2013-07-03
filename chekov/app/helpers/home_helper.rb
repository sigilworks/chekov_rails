require 'userpresenter'
require 'taskrowpresenter'

module HomeHelper

  def me
    UserPresenter.new(@user)
  end

  def tasklist
    @tasks.map { |task| TaskRowPresenter.new(task) }
  end

end
