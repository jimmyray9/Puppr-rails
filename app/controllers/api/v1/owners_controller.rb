class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :update, :destroy]

  def index
    @owners = Owner.all
    render json: @owners
  end

  def show
    render json: @owner
  end

  def update
    if @owner.update(owner_params)
      render json: @owner
    else
      render_error
    end
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      render json: @owner, status: :created
    else
      render_error
    end
  end

  def destroy
    @owner.destroy
    head :no_content
  end

  private

  def set_owner
    @owner = Owner.find(params[:id])
  end

   def owner_params
    params.require(:owner).permit(:name, :zip_code)
  end

  def render_error
    render json: { errors: @owner.errors.full_messages }, status: :unprocessable_entity
  end
end


