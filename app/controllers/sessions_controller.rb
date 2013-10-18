class SessionsController < ApplicationController

  before_filter :why_you_no_log_out, only: [:new, :create]


  def new
    @user = User.new(params[:user])
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],
    params[:user][:password])

    if @user
      login_user(@user)
      redirect_to subs_url
    else
      flash[:errors] =[ "Incorrect username or password" ]
      redirect_to new_session_url
    end
  end

  def destroy
    current_user.reset_session_token!
    current_user = nil
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
