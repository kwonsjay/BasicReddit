module SessionsHelper

  def current_user=(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def login_user(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    current_user = user
  end

  def why_you_no_log_out
    redirect_to subs_url if logged_in?
  end
end
