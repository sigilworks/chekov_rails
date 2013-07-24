class LoginsController < ApplicationController

  # logs user in, puts user id in session cookie
  def create
    if user = User.authenticate(params[:username])
      session.permanent.signed[:current_user_id] = user.id
      flash[:notice] = "Welcome, #{ current_user }!"
      redirect_to :back
    end
  end


  # logs user out, removes user id from session cookie
  def destroy
    session.permanent.signed[:current_user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end

  # alias the method names to their more traditional counterparts
  alias_method :login, :create
  alias_method :logout, :destroy

end
