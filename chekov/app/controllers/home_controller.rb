
class HomeController < ApplicationController

  def index

  	@user = User.find(2)

    respond_to do |format|
      format.html
    end
  end

end
