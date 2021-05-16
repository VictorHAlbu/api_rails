class ApplicationController < ActionController::Base
    before_action :valida_token_api

    def valida_token_api
        if request.path_parameters[:format] == 'json'
            if Token.where(valor: params[:token]).count == 0
             render json: {mensagem: "Token inválido ou vazio"}, status: 401
            else
                AcessosApi.create(token: params[:token], url: request.original_url)
            end
        end
        
    end
end
