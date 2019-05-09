class Api::V1::AllTrackingsController < Api::V1::BaseController
    def all
        @trackings = Tracking.all
        render json: @trackings
    end

    def destroy
        @tracking = Tracking.find(params[:tracking_id])
        if @tracking.destroy
            puts "success"
          else 
            render_error
        end
    end

    def destroy_all
        if Tracking.destroy_all
            puts "success"
          else 
            render_error
        end
    end
end