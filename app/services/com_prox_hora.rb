class ComProxHora

    require 'net/http'
    require 'json'

    def buscar(cidade)
        url = "https://api.openweathermap.org/data/2.5/forecast?APPID=fbc91763876522060b616d2e909f2a86&q=#{cidade},br"
        retorno = JSON.parse(Net::HTTP.get(URI(url)))
    end
end