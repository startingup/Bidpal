
class PasswordsController < Devise::PasswordsController

def update

  if params[:user][:reset_password_token].blank?
    
    respond_with resource, :location => users_path
    flash[:notice] = "Password field cannot be blank."
	return
  end

  @user = User.where(:reset_password_token => params[:user][:reset_password_token]).limit(1).first

  if @user.update_attributes(params[:user])
      flash[:notice] = "password has been changed"
	respond_with resource, :location => users_path
  else
    render :action => :edit
	flash[:notice] = "Sorry - Failed to reset password."
  end
end
end