class ClimaController < ApplicationController
    

    def buscar
        render json:Comunicacao.new.buscar(cidade_params[:cidade]), status: :ok
    end

    private

    def cidade_params
        params.permit(:cidade)
    end

    def proximas_horas
    end


    def proximos_dias
    end

end
