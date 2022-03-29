class SessionsController < ApplicationController
    def create
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            token = Token.find_or_create_by(user: @user)
            render json: { token: token.token_number }, status: 200
        else
            render json: { error: "Credenciais inválidas!" }, status: 403
        end
    end
end
