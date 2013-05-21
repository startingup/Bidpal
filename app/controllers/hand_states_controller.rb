class HandStatesController < ApplicationController
  # GET /hand_states
  # GET /hand_states.json
  set_tab :dealer
  def index
    @hand_states = HandState.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hand_states }
    end
  end

  # GET /hand_states/1
  # GET /hand_states/1.json
  def show
    @hand_state = HandState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hand_state }
    end
  end

  # GET /hand_states/new
  # GET /hand_states/new.json
  def new
    @hand_state = HandState.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hand_state }
    end
  end

  # GET /hand_states/1/edit
  def edit
    @hand_state = HandState.find(params[:id])
  end

  # POST /hand_states
  # POST /hand_states.json
  def create
    @hand_state = HandState.new(params[:hand_state])

    respond_to do |format|
      if @hand_state.save
        format.html { redirect_to @hand_state, notice: 'Hand state was successfully created.' }
        format.json { render json: @hand_state, status: :created, location: @hand_state }
      else
        format.html { render action: "new" }
        format.json { render json: @hand_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hand_states/1
  # PUT /hand_states/1.json
  def update
    @hand_state = HandState.find(params[:id])

    respond_to do |format|
      if @hand_state.update_attributes(params[:hand_state])
        format.html { redirect_to @hand_state, notice: 'Hand state was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hand_state.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def tff
    
    respond_to do |format|
      format.json { redirect_to hand_states_url }
     # format.js render :text => "hello"
    end
 end
 
 def handTypes
    @users = User.where("last_request_at > :Time", :Time => Time.now - 5.hour)
    @users.each do |user|
      @user = user.name
    end
 end
 
def preview1
   
end

def preview2
   
end

def preview3
   
end

def preview4
   
end
 

  # DELETE /hand_states/1
  # DELETE /hand_states/1.json
  def destroy
    @hand_state = HandState.find(params[:id])
    @hand_state.destroy

    respond_to do |format|
      format.html { redirect_to hand_states_url }
      format.json { head :no_content }
    end
  end
  
  def process_input

  end
end
