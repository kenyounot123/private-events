class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = 'Event successfully created'
      redirect_to event_path(@event)
    else
      flash[:error] = 'Something went wrong'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def attend
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      flash[:fail] = 'You are already in this event'
      redirect_to @event
    else
      @event.attendees << current_user
      redirect_to @event
    end
  end

  def cancel_attend
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    flash[:success] = 'You are no longer attending this event'
    redirect_to @event
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "Your event was updated"
    else
      render :edit
    end
  end


  private

  def event_params
    params.require(:event).permit(:title, :date, :location)
  end


end
