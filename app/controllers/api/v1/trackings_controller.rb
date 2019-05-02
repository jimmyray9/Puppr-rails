class Api::V1::TrackingsController < Api::V1::BaseController
  before_action :set_tracking, only: [:show, :update, :destroy]
    def index
        @appointment = Appointment.find(params[:appointment_id])
        @trackings = Tracking.all
        @array = []
        @trackings.each do |tracking|
            @array << tracking if tracking.appointment == @appointment
        end
        render json: @array
    end

    def show
        @appointment = Appointment.find(params[:appointment_id])
        render json: @tracking if @tracking.appointment == @appointment
    end

    def update
        @appointment = Appointment.find(params[:appointment_id])
        @tracking.appointment = @appointment
        if @tracking.update(tracking_params)
        render json: @tracking
        else
        render_error
        end
    end

    def create
        @appointment = Appointment.find(params[:appointment_id])
        @tracking = Tracking.new(tracking_params)
        @tracking.appointment = @appointment
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
        params.require(:tracking).permit(:latitude, :longitude, :appointment_id)
    end

    def render_error
        render json: { errors: @tracking.errors.full_messages }, status: :unprocessable_entity
    end
end

