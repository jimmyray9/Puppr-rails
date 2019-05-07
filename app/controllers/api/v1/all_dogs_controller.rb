class Api::V1::AllDogsController < Api::V1::BaseController
    def all
        @dogs = Dog.all
        render json: @dogs
    end

    def destroy
        @dog = Dog.find(params[:dog_id])
        if @dog.destroy
            puts "success"
          else 
            render_error
        end
    end
end