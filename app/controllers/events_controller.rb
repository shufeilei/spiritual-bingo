class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.limit(10).order(start_at: :asc)
    render json: @events
  end

  def show
    render json: @event
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
    end
  end

  def create
    event = Event.new(event_params)
    if event.save
      render json: event
    else
    end
  end

  def destroy
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :start_at,
      :end_at, :backgroundImagePath)
  end

end
