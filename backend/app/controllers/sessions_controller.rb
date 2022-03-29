class SessionsController < ApplicationController
    def create
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            render json: { token: "" }, status: 200
        else
            render json: { error: "Credenciais inválidas!" }, status: 403
        end
    end
end
