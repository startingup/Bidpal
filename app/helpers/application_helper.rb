module ApplicationHelper
#for current user to use through out the app
def current_user
 @current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
end
end
