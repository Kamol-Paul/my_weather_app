import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var degree = "\u00B0";
  var tempData = 25;
  var location = "Current Location";
  var search = "search";
  var longi,lati;
  TextEditingController textEditingController = TextEditingController();
  void getWeather() async {
    if (kDebugMode) {
      print("Praised");
    }
    if (kDebugMode) {
      print("We Get the Value from the User: ${textEditingController.text}");
    }

    var serviceStatus = await Geolocator.isLocationServiceEnabled();
    if (kDebugMode) {
      print(serviceStatus);
    }


    LocationPermission locationPermission = await Geolocator.checkPermission();

    if(locationPermission == LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();

      if(locationPermission == LocationPermission.denied){
        print("permission denied");
      } else if(locationPermission == LocationPermission.deniedForever){
        print("forget it. it's reject forever.");
      } else {
        print("permission given");
      }
    }else {
      print("Permission Hold");
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    longi = position.longitude.toString();
    lati = position.longitude.toString();

    print("Longitude : " + longi);
    print("Latitute : " + lati);

  }
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        color: Colors.blue.shade500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Center(
              //alignment: Alignment.center,
              //color: Colors.green,
              child:  Container(
                alignment: Alignment.center,
                color: Colors.green.shade300,
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
            ))

          ],
        ));
  }
}
