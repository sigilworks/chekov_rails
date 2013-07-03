
class HomeController < ApplicationController

  def index

  	@user = User.find(2)
  	@status_list = Status.all
  	@tasks = Task.all

    respond_to do |format|
      format.html
    end
  end

end
