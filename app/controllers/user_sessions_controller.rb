class UserSessionsController < ApplicationController
 
  def new
    @user_session = UserSession.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render xml: @user_session }
    end
  end

  
  def create
    @user_session = UserSession.new(params[:user_session])
	session[:name] = @user_session.username
    respond_to do |format|
      if @user_session.save
        format.html { redirect_to(:hand_states, :notice => 'Login Successful') }
        format.xml { render xml: @user_session, status: :created, :location => @user_session }
      else
        format.html { render action: "new" }
        format.xml { render xml: @user_session.errors, status => :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    #@user = User.find(current_user_id)
    #@user.update_attribute(:last_sign_out_at, Time.now)
    respond_to do |format|
      format.html { redirect_to(:login, :notice => 'GoodBye!') }
      flash[:notice] = "good bye"
      format.xml { head :ok }
    end
  end

end