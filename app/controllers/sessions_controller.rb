
class SessionsController < Devise::SessionsController

  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  prepend_before_filter :allow_params_authentication!, :only => :create
  prepend_before_filter { request.env["devise.skip_timeout"] = true }

  # GET /resource/sign_in
  def new
    resource = build_resource
    clean_up_passwords(resource)
    respond_with resource, :location =>  users_path
  end
  
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "user_sessions#new")
    sign_in(resource_name, resource)
    respond_with resource, :location =>  hand_states_path #users_path
  end
  
   # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  def serialize_options(resource)
   super
  end

  def auth_options
   super
  end
end