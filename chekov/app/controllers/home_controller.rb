
class HomeController < ApplicationController
    include ActionController::Live

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
    @user_list = User.reals.order(:last_name => :asc)

    # obtains the Tasks to populate the table on the page,
    # filtered by user's privileges and by his chosen view
    @current_filter = params[:filter]
    @tasks = TaskFilterService
        .with_tasks(Task.all.order(:updated_at => :desc))
        .for_user(@user)
        .with_filter(@current_filter)
        .filtered_tasks

    # respond_to do |format|
    #  format.html
    # end
    render :stream => true
  end

  # def notify_updates(event_name, data)
  #   evt = EventStreamingService.with_stream(response.stream)
  #   response.headers['Content-Type'] = 'text/event-stream'
  #   sleep 5
  #   event_name = :task_update
  #   data = { :task_id => n, :change => "Task #{ n } has changed!" }
  #   evt.write(event_name, data)
  #   render :nothing => true
  # rescue IOError
  #   # client disconnected
  # ensure
  #   evt.close
  # end

end
