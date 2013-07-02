require 'userpresenter'

module HomeHelper

  def me
    UserPresenter.new(@user)
  end

end
