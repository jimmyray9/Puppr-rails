class Api::V1::FindAppsByDogsController < Api::V1::BaseController
    def apps
        @dog = Dog.find(params[:dog_id])
        @apps = @dog.appointments
        render json: @apps
    end
end