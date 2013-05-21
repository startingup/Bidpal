class ApplicationController < ActionController::Base
  protect_from_forgery
  include  ApplicationHelper
  helper_method :current_user  #make this method available in views

private

def current_user_session
	return @current_user_session if defined?(@current_user_session)
@current_user_session = UserSession.find
end

# def current_user
	# return @current_user if defined?(@current_user)
# @current_user = current_user_session && current_user_session.record
# end

rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied."
  redirect_to root_url
end

def current_user
 return @current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
end

end
