class ChoicesController < ApplicationController
    before_action :authorize_request

    def index
        @choice = Choice.find_by(user: @current_user)
        render json: @choice, status: :ok
    end

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
        params.require(:choice).permit(:remote_director_id, :remote_movie_id, :remote_director_name, :remote_movie_name)
    end
end
