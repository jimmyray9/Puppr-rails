class Api::V1::WalkersController < Api::V1::BaseController
  before_action :set_walker, only: [:show, :update, :destroy]

  def index
    @walkers = Walker.all
    render json: @walkers
  end

  def show
    render json: @walker
  end

  def update
    if @walker.update(walker_params)
      render json: @walker
    else
      render_error
    end
  end

  def create
    @walker = Walker.new(walker_params)
    if @walker.save
      render json: @walker, status: :created
    else
      render_error
    end
  end

  def destroy
    if @walker.destroy
      puts "success"
    else 
      render_error
    end
  end

  private

  def set_walker
    @walker = Walker.find(params[:id])
  end

   def walker_params
    params.require(:walker).permit(:name, :zip_code)
  end

  def render_error
    render json: { errors: @walker.errors.full_messages }, status: :unprocessable_entity
  end
end
