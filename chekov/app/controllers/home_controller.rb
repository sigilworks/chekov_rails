
class HomeController < ApplicationController

  def index

  	@user = User.find(2)
  	@status_list = Status.all

  	filter = is_valid_status(params[:filter]) ? params[:filter] : 'all'
  	@tasks = filtered_tasks(filter)

    respond_to do |format|
      format.html
    end

  end


  private

  	def is_valid_status(param)
		param.in? Status.all.map(&:shortname)
  	end

  	def filtered_tasks(filter)
		filter == 'all' ? Task.all.order('updated_at DESC') : Task.where(:status_id => Status.where(:shortname => filter)).order('updated_at DESC')
  	end


end
