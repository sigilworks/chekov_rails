
class HomeController < ApplicationController
  skip_before_action :require_login

  def index

    @is_logged_in = logged_in?
    @user = logged_in? ? current_user : User.nobody

    @assignee_list = User.assignees
    @app_list = Application.all
    @browser_list = Browser.all
    @status_list = Status.all + Status.custom
    @user_list = User.reals.order(:last_name => :asc)

    filter = is_valid_status(params[:filter]) ? params[:filter] : 'all'
    @tasks = filtered_tasks(filter)

    respond_to do |format|
      format.html
    end

  end

  private

    # determines list of valid statuses, with custom ones added
    def is_valid_status(param)
      param.in? Status.all.map(&:shortname) + Status.custom
    end

    def filtered_tasks(filter)
      case filter
      when 'all'
        Task.all.order(:updated_at => :desc)
      when *Status.all.map(&:shortname)
        Task.where(:status_id => Status.where(:shortname => filter)).order(:updated_at => :desc)
      when 'mine'
        Task.where(:assignee => current_user).order(:updated_at => :desc)
      end
    end

end
