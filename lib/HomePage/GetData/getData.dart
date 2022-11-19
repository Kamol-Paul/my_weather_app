import 'dart:convert';

import 'package:http/http.dart';

class WeatherInformationMachine{
   Future<Map<String, dynamic>> getDataWithCity(String cityName) async{
    final queryParameter = {
      "q" : cityName,
      "appid" : "d1725cf8fa5df91fe1ce207be477d8ac"
    };
    final uri = Uri.https("api.openweathermap.org", "/data/2.5/weather",queryParameter);
    final response = await get(uri);
    final data = jsonDecode(response.body);
    return data;
  }
  Future<Map<String, dynamic>> getDataWithLongLat(String lon, String lat) async{

    final queryParameter = {
      "lon" : lon,
      "lat" : lat,
      "appid" : "d1725cf8fa5df91fe1ce207be477d8ac"
      //"units" : "imperial"
    };
    final uri = Uri.https("api.openweathermap.org", "/data/2.5/weather",queryParameter);
    final response = await get(uri);
    final data =  jsonDecode(response.body) as Map<String,dynamic>;
    return data;
  }
  static Map<String,dynamic> getSample(){
     return {"coord": {"lon": 88.6367, "lat": 24.3704}, "weather": [{"id": 803, "main": "Clouds", "description": "broken clouds", "icon": "04d"}], "base": "stations", "main": {"temp": 300.74, "feels_like": 300.35, "temp_min": 300.74, "temp_max": 300.74, "pressure": 1010, "humidity": 38, "sea_level": 1010, "grnd_level": 1008}, "visibility": 10000, "wind": {"speed": 3.98, "deg": 348, "gust": 3.99}, "clouds": {"all": 76}, "dt": 1668850387, "sys": {"country": "BD", "sunrise": 1668817421, "sunset": 1668856687}, "timezone": 21600, "id": 1185128, "name": "Rajshahi", "cod": 200};
  }
}