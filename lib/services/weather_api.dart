// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weathersample/Model/weather_Model.dart';

//create a class for calling API
class WeatherApiCliant {
  /*create a future Function and inside the Future Function there is
   a parameters inside the parameters there is a Space to insert the Location*/
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=fc01c45b037f2d7575e95a2acaf88e0d&units=metrics');
    var responce = await http.get(endpoint);
    var body = jsonDecode(responce.body);
    return Weather.fromjson(body);
  }
}
