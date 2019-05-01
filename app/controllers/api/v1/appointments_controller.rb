class Api::V1::AppointmentsController < Api::V1::BaseController
    before_action :set_appointment, only: [:show, :update, :destroy]
    def index
        @walker = walker.find(params[:walker_id])
        @appointments = Appointment.all
        @array = []
        @appointments.each do |appointment|
        @array << appointment if appointment.walker == @walker
        end
        render json: @array
    end

    def show
        @walker = walker.find(params[:walker_id])
        render json: @appointment if @appointment.walker == @walker
    end

    def update
        @walker = walker.find(params[:walker_id])
        @appointment.walker = @walker

        if @appointment.update(appointment_params)
        render json: @appointment
        else
        render_error
        end
    end

    def create
        @appointment = Appointment.new(appointment_params)
        @walker = walker.find(params[:walker_id])
        @appointment.walker = @walker

        if @appointment.save
        render json: @appointment, status: :created
        else
        render_error
        end
    end

    def destroy
        @appointment.destroy
        head :no_content
    end

    private

    def set_appointment
        @appointment = Appointment.find(params[:id])
    end

    def appointment_params
        params.require(:appointment).permit(:duration, :note, :start_time, :date, :location, :is_scheduled, :comment, :rating :address, :duration, :walker_id)
    end

    def render_error
        render json: { errors: @appointment.errors.full_messages }, status: :unprocessable_entity
    end
end
