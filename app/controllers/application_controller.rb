class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
    helper_method :current_user
    helper_method :logged_in?
  
  @@test_mode = true;
  
  def current_user
    if (@@test_mode)
      # I really have no idea on how to mock a user so it will use my user id instead
      @current_user = User.find_by_id(1)
      return @current_user
    else
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
  
    def logged_in?
      if (@@test_mode)
        return true
      end
        return current_user != nil
    end
end
