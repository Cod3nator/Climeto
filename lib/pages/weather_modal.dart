
/*
{"coord":{"lon":139.6917,"lat":35.6895},
   "weather":[{"id":701,"main":"Mist","description":"mist","icon":"50n"},
    {"id":521,"main":"Rain","description":"shower rain","icon":"09n"}],
   "base":"stations",
   "main":{"temp":285.05,"feels_like":284.8,"temp_min":284.03,"temp_max":285.94,"pressure":1002,"humidity":96},
   "visibility":5000,
   "wind":{"speed":5.14,"deg":10},
   "rain":{"1h":0.59},
   "clouds":{"all":75},
   "dt":1683479540,
   "sys":{"type":2,"id":268395,"country":"JP","sunrise":1683488577,"sunset":1683538354},
   "timezone":32400,
   "id":1850144,
   "name":"Tokyo",
   "cod":200}
*/
class WeatherInfo{
  final String description;
  final String icon;
  final String maindesc;
  WeatherInfo({required this.description,required this.icon,required this.maindesc});
  factory WeatherInfo.fromJson(Map<String, dynamic>json){
    final mainTitle=json["main"];
    final desc=json["description"];
    final icon=json["icon"];
    return WeatherInfo(maindesc:mainTitle,description: desc,icon: icon);
  }
}
class Wind{
  final double? speed;
  Wind({required this.speed});
  factory Wind.fromJson(Map<String, dynamic>json){
    final wind = json["wind"];
    return Wind(speed: wind);
  }
}
class Temperature{
  final double temperature;
  final int humidity;
  final int pressure;
  Temperature({required this.temperature,required this.humidity, required this.pressure});
  factory Temperature.fromJson(Map<String,dynamic>json){
    final temperature=json["temp"];
    final humidity=json["humidity"];
    final pressure=json["pressure"];
    return Temperature(temperature: temperature,humidity: humidity,pressure:pressure);
  }

}

class WeatherModal {
  final String cityName;
  final int visibility;
  final Temperature temp;
  final Wind wind;
  final WeatherInfo weather;
  final int code;

  WeatherModal({required this.cityName,required this.visibility,required this.temp,required this.wind, required this.weather,required this.code});

  factory WeatherModal.fromJson(Map<String, dynamic> json) {
    final cod=json["cod"];

    final cityName = json['name'];
    final visible=json["visibility"];


    final tempInfoJson=json["main"];
    final tempInfo=Temperature.fromJson(tempInfoJson);

    final windInfoJson=json["wind"];
    final windInfo=Wind.fromJson(windInfoJson);

    final weatherInfoJson=json["weather"][0];
    final weatherInfo=WeatherInfo.fromJson(weatherInfoJson);
    return WeatherModal(cityName: cityName, visibility: visible,temp:tempInfo,wind: windInfo, weather: weatherInfo,code: cod);
  }
}
