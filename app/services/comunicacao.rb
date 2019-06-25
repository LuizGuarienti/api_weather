class Comunicacao

    require 'net/http'
    require 'json'
    require 'time'

    def buscar(cidade)
    @cidade = cidade
    url = "https://api.openweathermap.org/data/2.5/weather?APPID=fbc91763876522060b616d2e909f2a86&q=#{cidade},br"
    retorno = JSON.parse(Net::HTTP.get(URI(url))) 
    # ret = {"data": retorno["dt"],"vento": retorno["wind"]["speed"]}

    ret = {"data": Time.at(retorno["dt"]),
            "clima": retorno["weather"][0]["main"],
            "descricao": retorno["weather"][0]["description"],
            "temperatura": retorno["main"]["temp"],
            "pressao": retorno["main"]["pressure"],
            "humidade": retorno["main"]["humidity"],
            "temperatura_maxima": retorno["main"]["temp_max"],
            "temperatura_minima": retorno["main"]["temp_min"],
            "vento": retorno["wind"]["speed"],
            "alvorada": retorno["sys"]["sunrise"],
            "crepusculo": retorno["sys"]["sunset"]} 
    end
end
    # {"coord":{"lon":-53.44,"lat":-24.96},
# "weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],
# "base":"stations",
# "main":{"temp":291.835,"pressure":1018.66,"humidity":88,"temp_min":291.835,"temp_max":291.835,"sea_level":1018.66,"grnd_level":941.81},
# "wind":{"speed":2.98,"deg":56.555},
# "clouds":{"all":100},
# "dt":1560559594,
# "sys":{"message":0.0379,"country":"BR","sunrise":1560507369,"sunset":1560545517},
# "timezone":-10800,"id":3466779,"name":"Cascavel","cod":200}

