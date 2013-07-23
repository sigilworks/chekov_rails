class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # ensuring all controllers use the main template
  # to render by default
  layout 'layouts/application'
end
