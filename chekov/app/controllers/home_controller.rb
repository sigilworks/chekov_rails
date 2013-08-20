
class HomeController < ApplicationController
  # prevent redirect loop. Need index page to be able to login, anyways!
  skip_before_action :require_login

  def index
    # current user variable, used almost everywhere, often as `me`
    @user = logged_in? ? current_user : User.nobody

    # these lists are largely used to populate various <select>
    # menus and page components, rendered in their own partials
    @assignee_list = User.assignees
    @app_list = Application.all
    @browser_list = Browser.all
    @user_list = User.reals.order(:last_name => :asc)

    # obtains the Tasks to populate the table on the page,
    # filtered by user's privileges and by his chosen view
    @current_filter = params[:filter]
    @tasks = TaskFilterService
        .with_tasks(Task.all.order(:updated_at => :desc))
        .for_user(@user)
        .with_filter(@current_filter)
        .filtered_tasks

    @recents = RecentActivityService.for_user(@user)
    # update internal flag in user record of last time they accessed the application
    # is used to determine update 'deltas' since data on client was last retrieved
    @user.update_attribute(:last_visited_at, Time.now)

    respond_to do |format|
      format.html
    end
    # render :stream => true
  end

end
