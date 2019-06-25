class ComProxDia

    require 'net/http'
    require 'json'
    require 'time'

    def buscar(cidade)
        @cidade=cidade
        url = "https://api.openweathermap.org/data/2.5/forecast?APPID=fbc91763876522060b616d2e909f2a86&q=#{cidade},br"
        retorno = JSON.parse(Net::HTTP.get(URI(url)))

        ret = []
        
        retorno["list"].each do |horario|
            ret << {hora: Time.at(horario["dt"]),
            clima: horario["clouds"]["all"],
            descricao: horario["weather"][0]["description"],
            temperatura: horario["main"]["temp"],
            pressao: horario["main"]["pressure"],
            humidade: horario["main"]["humidity"],
            temperatura_minima: horario["main"]["temp_min"],
            temperatura_maxima: horario["main"]["temp_max"],
            vento: horario["wind"]["speed"]
            }
        end 
        ret
    end
end

