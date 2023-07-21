import 'dart:convert';
import 'package:climeto/pages/weather_modal.dart';
import 'package:http/http.dart' as http;
class DataService{
  Future<WeatherModal> getWeather(String city )async{
//https://api.openweathermap.org/data/2.5/weather?id={city id}&appid={API key}
  
  final queryParameters={
    'q':city,
    'appid':'65bede5baa350de98495076591aeea46',
    'units':'metric',
  };
   
  final uri=Uri.https('api.openweathermap.org','/data/2.5/weather',queryParameters);
  final  response = await http.get(uri);

  print(response.body);
  final json=jsonDecode(response.body);
  return WeatherModal.fromJson(json);
  }
  
}
