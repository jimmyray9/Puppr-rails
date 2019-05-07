class Api::V1::AllDogsController < Api::V1::BaseController
    def all
        @dogs = Dog.all
        render json: @dogs
    end
end