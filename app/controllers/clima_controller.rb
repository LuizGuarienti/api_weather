class ClimaController < ApplicationController
    

    def buscar
        render json:Comunicacao.new.buscar(cidade_params[:cidade]), status: :ok
    end

    def prox_hora_buscar
        render json:ComProxHora.new.buscar(cidade_params[:cidade]), status: :ok
    end


    def prox_dia_buscar
        render json:ComProxDia.new.buscar(cidade_params[:cidade]), status: :ok
    end

    private

    def cidade_params
        params.permit(:cidade)
    end
end