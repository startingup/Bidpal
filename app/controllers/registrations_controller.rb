class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  
  #before_filter :check_permissions, :only => [:new, :create, :cancel]
  #skip_before_filter :require_no_authentication

  def new
    format.html { redirect_to(:user_sessions, :notice => 'Welcome to BidPal.') }  # changed
  end
  
  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
 		format.html { redirect_to(:user_sessions, :notice => 'Registration successfull.') }  #changed
		else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => users_path
      end
    else
      clean_up_passwords resource
      respond_with resource
    end

  end
	
 
  def update
    super
  end
  end
  