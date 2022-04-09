class SessionsController < ApplicationController
    def create
        @user = User.find_by_login(params[:login])
        if @user&.authenticate(params[:password])
            token = Token.find_or_create_by(user: @user)
            render json: { token: token.token_number }, status: :ok
        else
            render json: { error: "Credenciais inválidas!" }, status: :unauthorized
        end
    end
end
