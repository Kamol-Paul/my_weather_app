import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_weather_app/HomePage/GetData/getData.dart';
class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var degree = "\u00B0";
  var tempData = "25.09";
  var location = "Current Location";
  var search = "search";
  var description = "Welcome";
  var longi,lati;
  TextEditingController textEditingController = TextEditingController();
  void getWeather() async {
    if (kDebugMode) {
      print("Praised");
    }
    if (kDebugMode) {
      print("We Get the Value from the User: ${textEditingController.text}");
    }

    var machine = WeatherInformationMachine();
    Map<String,dynamic> response = await machine.getDataWithCity(textEditingController.text);
    if(response["cod"] == 200){
      double tempDegree = response['main']['temp'] - 273;
      setState(() {
        location = "In location " + response["name"];
        tempData = tempDegree.toStringAsPrecision(2);
        description = response['weather'][0]['description'];

      });
    }


  }
  void loadData() async{
    var serviceStatus = await Geolocator.isLocationServiceEnabled();
    if (kDebugMode) {
      print(serviceStatus);
    }


    LocationPermission locationPermission = await Geolocator.checkPermission();

    if(locationPermission == LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();

      if(locationPermission == LocationPermission.denied){
        if (kDebugMode) {
          print("permission denied");
        }
      } else if(locationPermission == LocationPermission.deniedForever){
        if (kDebugMode) {
          print("forget it. it's reject forever.");
        }
      } else {
        if (kDebugMode) {
          print("permission given");
        }
      }
    }else {
      if (kDebugMode) {
        print("Permission Hold");
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
    longi = position.longitude.toStringAsFixed(2);
    lati = position.latitude.toStringAsFixed(2);

    var machine = WeatherInformationMachine();
    var response = await machine.getDataWithLongLat(longi, lati);

    if(response["cod"] == 200){
      double tempDegree  = response['main']['temp'] - 273;

      setState(() {
        tempData = tempDegree.toStringAsPrecision(2);
        location = "Current Location " + response["name"];
        description = response['weather'][0]['description'];
      });
    }


  }
  @override
  void initState() {
    super.initState();
    loadData();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        color: Colors.blue.shade500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              location,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 1,
                  backgroundColor: Colors.green,
                  fontFamily: "monospace"),
            ),
            Text(tempData.toString() + degree,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal,
                  fontSize: 40,
                )),
            Text(
              description,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 20
              ),
            ),
            Center(
              //alignment: Alignment.center,
              //color: Colors.green,
              child:  Container(
                alignment: Alignment.center,
                color: Colors.amberAccent,
                width: 200,
                child:  TextField(
                  controller: textEditingController,
                  textAlign: TextAlign.center,

                ),
              ),
            ),
            TextButton(onPressed: getWeather, child: Text(
              search,
              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            )),
            TextButton(onPressed: loadData, child: const Text(
              "Get Current Location Temperature",
              style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 21,
            fontFamily: 'monospace'
              )
            )
            )


          ],
        ));
  }
}
