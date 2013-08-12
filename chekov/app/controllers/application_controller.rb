class ApplicationController < ActionController::Base

  before_action :require_login

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # ensuring all controllers use the main template
  # to render by default
  layout 'layouts/application'

  # adding custom flash message types
  add_flash_types :info, :success

  # returns whether or not the current user is properly logged in in the current session
  def logged_in?
    !!current_user
  end

  # private
  protected

  # Finds the User object with the id stored in the session at key `:current_user_id`
  def current_user
    @_current_user ||= cookies.permanent.signed[:current_user_id] && User.find_by(:username => cookies.permanent.signed[:current_user_id])
  end
  helper_method :current_user

  def require_login
    # unless logged_in?
    #  flash[:error] = "You must be logged in to use this feature!"
    #  redirect_to root_url
    # end
  end

end
