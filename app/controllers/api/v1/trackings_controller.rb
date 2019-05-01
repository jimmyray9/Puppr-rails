class TrackingsController < ApplicationController
  before_action :set_tracking, only: [:show, :update, :destroy]

  def index
    @trackings = Tracking.all
    render json: @trackings
  end

  def show
    render json: @tracking
  end

  def update
    if @tracking.update(tracking_params)
      render json: @tracking
    else
      render_error
    end
  end

  def create
    @tracking = Tracking.new(tracking_params)
    if @tracking.save
      render json: @tracking, status: :created
    else
      render_error
    end
  end

  def destroy
    @tracking.destroy
    head :no_content
  end

  private

  def set_tracking
    @tracking = Tracking.find(params[:id])
  end

   def tracking_params
    params.require(:tracking).permit(:latitude, :longitude)
  end

  def render_error
    render json: { errors: @tracking.errors.full_messages }, status: :unprocessable_entity
  end
end

