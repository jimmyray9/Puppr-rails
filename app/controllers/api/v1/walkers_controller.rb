class WalkersController < ApplicationController
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
    @walker.destroy
    head :no_content
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
