class DogsController < ApplicationController
    before_action :set_dog, only: [:show, :update, :destroy]
    def index
        @owner = Owner.find(params[:owner_id])
        @dogs = Dog.all
        @array = []
        @dogs.map do |dog|
        @array << dog if dog.owner == @owner
        end
        render json: @array
    end

    def show
        @owner = Owner.find(params[:owner_id])
        render json: @dog if @dog.owner == @owner
    end

    def update
        @owner = Owner.find(params[:owner_id])
        @dog.owner = @owner
        if @dog.update(dog_params)
        render json: @dog
        else
        render_error
        end
    end

    def create
        @owner = Owner.find(params[:owner_id])
        @dog = Dog.new(dog_params)
        @dog.owner = @owner
        if @dog.save
        render json: @dog, status: :created
        else
        render_error
        end
    end

    def destroy
        @dog.destroy
        head :no_content
    end

    private

    def set_dog
        @dog = Dog.find(params[:id])
    end

    def dog_params
        params.require(:dog).permit(:breed, :name, :description, :age, :size, :pic, :gender, :owner_id)
    end

    def render_error
        render json: { errors: @dog.errors.full_messages }, status: :unprocessable_entity
    end       
end
