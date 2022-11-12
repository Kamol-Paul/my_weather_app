import 'dart:convert';

import 'package:flutter/foundation.dart';
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
    if (kDebugMode) {
      print(data);
    }
    return data;
  }
  Future<Map<String, dynamic>> getDataWithLongLat(String lon, String lat) async{
     if (kDebugMode) {
       print(lon + lat);
     }
    final queryParameter = {
      "lon" : lon,
      "lat" : lat,
      "appid" : "d1725cf8fa5df91fe1ce207be477d8ac"
      //"units" : "imperial"
    };
    final uri = Uri.https("api.openweathermap.org", "/data/2.5/weather",queryParameter);
    final response = await get(uri);
    final data =  jsonDecode(response.body) as Map<String,dynamic>;
    if (kDebugMode) {
      print(data);
    }
    return data;
  }
}