class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @group = Group.find(session[:group_id]) if session[:group_id]
    @event = Event.new(params[:event])
    #REFACTOR
    if @event.save
      if session[:group_id] == nil
        current_user.events << @event
        @event.users << current_user
      end
      if session[:group_id] && @group.admins.include?(@current_user)
        @group.events << @event
        @event.groups << @group
      end
      
      if @event.event_type_id == 1
        # @tournament = Tournament.new
        redirect_to new_event_tournament_path @event
      else
        redirect_to @event, notice: 'Event was successfully created.'
      end
    
    else
      render action: "new"
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    #refactor for multiple event
    @event = Event.find(:all, :conditions => ['event_name LIKE ?', "%#{params['search']}%"]).first
    redirect_to events_path if @game == nil 
    if session[:group_id]
      @group = Group.find(session[:group_id])
      @group.events << @event
      redirect_to group_path(session[:group_id])
    else
      @user = User.find(session[:id])
      @user.events << @event if @user
      redirect_to root_path
    end
  end

  def add_user_event
    p params
    @user = User.find(session[:id])
    @event = Event.find(params[:id])
    @event.users << @user
    @user.events << @event
    redirect_to root_path
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
