class ApplicationController < ActionController::API
    def authorize_request
        login = request.headers['login']
        token = request.headers['token']

        @current_user = User.find_by_login(login)
        authorized_token = Token.find_by(user: @current_user, token_number: token)

        unless @current_user && authorized_token.present?
            render json: { error: "Credenciais inválidas!" }, status: :unauthorized
        end
    end

    rescue_from ActionController::ParameterMissing do |exception|
        error = "#{exception.param} é um parâmetro obrigatório!"
        render json: { error: error }, status: :unprocessable_entity
    end
end
