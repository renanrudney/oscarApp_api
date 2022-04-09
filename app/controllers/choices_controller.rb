class ChoicesController < ApplicationController
    before_action :authorize_request

    def create
        @choice = Choice.new(choice_params)
        @choice.user = @current_user
        if @choice.save
            render json: { choice: @choice }, status: :ok
        else
            error = @choice.errors.first.full_message
            render json: { error: error }, status: :unprocessable_entity
        end
    end


    private

    def choice_params
        params.require(:choice).permit(:remote_director_id, :remote_movie_id)
    end
end
