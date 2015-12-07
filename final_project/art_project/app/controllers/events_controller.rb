class EventsController < ApplicationController

  #The page the public can have access without log in is the index page.
  
  #Throw an exception if unauthorized user is trying to access this pages.
  #Like an log in user but when not admin preferences.

  #it's from cancan
   # load_and_authorize_resource
  
  #Authenticate user when trying to edit, create or modify events(if it's not log in).
  before_action :authenticate_user!,except: [:index,:show]

    #Apply this method for this actions.
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  
  def index
  
    # @events = Event.where('start >= ?', Date.today).order(:start)

     # @events = Event.all

     if params[:search_event].present?
      @events = Event.search(params[:search_event]).order("created_at DESC")
    else
      #If the searcher is empty, the show list of all events(order by last created)
      @events= Event.order("created_at DESC")
    end


    if params[:search_location].present?
      location_search = "%#{params[:search_location]}%"
      @events= Event.where("location LIKE ?", location_search)
      # @events = @events.where(location: event)
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit

  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
     
    def set_event
      
      @event = Event.find_by(id: params[:id]) or redirect_message
    end

    def redirect_message
      redirect_to '/404'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :location, :start_date, :ends_date, :image, :description, :organizer_name, :event_type)
    end
end
