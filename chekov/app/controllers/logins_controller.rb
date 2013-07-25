class LoginsController < ApplicationController

  # verify  :params => [:username],
  #         :render => { :action => "new" },
  #         :add_flash => { :error => "Username and required to log in!" },
  #         :only => :create # only run this verification for the `create` action

  # logs user in, puts user id in session cookie
  def create

    respond_to do |format|
      if user = User.authenticate(params[:username])
        cookies.permanent.signed[:current_user_id] = user.username
        flash.keep[:notice] = "Welcome, #{ current_user.first_name }!"

        format.html { redirect_to :back, :notice => "Welcome, you!" }
        format.js   {}
        format.json { render :json }
      else
        flash[:error] = "Unknown error prevented login. Please try again."
        format.html { redirect_to root_url }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end



  end

  # logs user out, removes user id from session cookie
  def destroy
    cookies.permanent.signed[:current_user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end

  # alias the method names to their more traditional counterparts
  alias_method :login, :create
  alias_method :logout, :destroy

end
