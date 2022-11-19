import 'package:geolocator/geolocator.dart';

import '../GetData/getData.dart';
class GetLocationData{
  static Future<Map<String, dynamic>> getResponseForCurrentLocation() async{
    LocationPermission locationPermission = await Geolocator.checkPermission();

    if(locationPermission == LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
    var longitude = position.longitude.toStringAsFixed(2);
    var latitude = position.latitude.toStringAsFixed(2);

    var machine = WeatherInformationMachine();
    var response = await machine.getDataWithLongLat(longitude, latitude);
    return response;

  }
}