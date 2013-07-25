
class HomeController < ApplicationController

  # prevent redirect loop. Need index page to be able to login, anyways!
  skip_before_action :require_login

  def index
    # needed (for now) down in header menu
    @is_logged_in = logged_in?

    # current user variable, used almost everywhere, often as `me`
    @user = logged_in? ? current_user : User.nobody

    # these lists are largely used to populate various <select>
    # menus and page components, rendered in their own partials
    @assignee_list = User.assignees
    @app_list = Application.all
    @browser_list = Browser.all
    @status_list = Status.all + Status.custom
    @user_list = User.reals.order(:last_name => :asc)

    # handles the various view filters of the task table
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

    # TODO: this should be extracted to another class (e.g., FilteredTaskStrategy object?)
    # determines which tasks are shown to each filter
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
