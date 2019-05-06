class Api::V1::WalksController < Api::V1::BaseController
    before_action :set_walk, only: [:show, :update, :destroy]
    def index
      @walks = Walk.all
      render json: @walks
    end
  
    def show
      @appointment = Appointment.find(params[:appointment_id])
      @dog = Dog.find(params[:dog_id])
      render json: @walk if @walk.appointment == @appointment && @walk.dog == @dog
    end
  
    def update
      @appointment = Appointment.find(params[:appointment_id])
      @walk.appointment = @appointment
      @dog = Dog.find(params[:dog_id])
      @walk.dog = @dog
  
      if @walk.update(walk_params)
        render json: @walk
      else
        render_error
      end
    end
  
    def create
      @walk = Walk.new(walk_params)
      @appointment = Appointment.find(params[:appointment_id])
      @walk.appointment = @appointment
      @dog = Dog.find(params[:dog_id])
      @walk.dog = @dog
  
      if @walk.save
        render json: @walk, status: :created
      else
        render_error
      end
    end
  
    def destroy
      @walk.destroy
      head :no_content
    end
  
    private
  
    def set_walk
      @walk = Walk.find(params[:id])
    end
  
     def walk_params
      params.require(:walk).permit(:appointment_id, :dog_id)
    end
  
    def render_error
      render json: { errors: @walk.errors.full_messages }, status: :unprocessable_entity
    end
  end
   