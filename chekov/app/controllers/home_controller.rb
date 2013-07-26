
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
    @status_list = Status.all + Filter.custom_filters
    @user_list = User.reals.order(:last_name => :asc)

    # obtains the Tasks to populate the table on the page,
    # filtered by user's privileges and by his chosen view
    @tasks = TaskFilterService.for_user(@user).with_filter(params[:filter]).filter_tasks

    # respond_to do |format|
    #   format.html
    # end
    render :stream => true
  end

end
