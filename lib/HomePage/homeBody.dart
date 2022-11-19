import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_weather_app/HomePage/GetData/getData.dart';
import 'package:my_weather_app/HomePage/GetData/CelToFar.dart';
import 'package:my_weather_app/HomePage/LocationData/GetLocationData.dart';
import 'package:my_weather_app/HomePage/TimeFeature/AdditionalFeature.dart';
import 'package:my_weather_app/HomePage/TimeFeature/TimerTest.dart';
class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var res = WeatherInformationMachine.getSample();

  var degree = "\u00B0" " C";
  var tempData = "25.09";
  var far = "98.4";
  var degreeF = "\u00B0" " F";
  var location = "Current Location";
  var search = "search";
  var description = "Welcome";
  var converter = CelToFar();
  var dateUpdate = TimerTest();
  var date = "current date",currentTime = "current time";
  void setDate(){
    setState(() {
      date = dateUpdate.getCurrentDate();
    });
  }
  void setTime(){
    setState(() {
      currentTime = dateUpdate.getCurrentTime();
    });
  }
  TextEditingController textEditingController = TextEditingController();

  void getWeather() async {

    var machine = WeatherInformationMachine();
    Map<String,dynamic> response = await machine.getDataWithCity(textEditingController.text);
    if(response["cod"] == 200){
      double tempDegree = response['main']['temp'] - 273;
      double farData = converter.getFar(tempDegree);

      setState((){
        location = "In location ${response['name']}";
        far = farData.toStringAsPrecision(2);
        tempData = tempDegree.toStringAsPrecision(2);
        description = response['weather'][0]['description'];
        res = response;
      });
    }


  }


  void loadData() async{
    Map<String,dynamic> response = await GetLocationData.getResponseForCurrentLocation();
    if(response["cod"] == 200){
      double tempDegree  = response['main']['temp'] - 273;
      double farData = converter.getFar(tempDegree);

      setState(() {
        tempData = tempDegree.toStringAsPrecision(2);
        far = farData.toStringAsPrecision(2);
        location = "Current Location ${response['name']}";
        description = response['weather'][0]['description'];
        res = response;
      });
    }


  }
  void setTimer(){
    Timer.periodic(
        const Duration(seconds: 1),(timer){
      setTime();
      setDate();
    }
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
    setTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        color: Colors.greenAccent,
        child :Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              location,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 1,
                  overflow: TextOverflow.visible,
                  color: Colors.purple,
                  fontFamily: "monospace"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

                Text(tempData.toString() + degree,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                      fontSize: 40,
                    )),
                Text(far.toString() + degreeF,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                      fontSize: 40,
                    )),
              ],
            ),
            Text(
              date,
            ),
            Text(
              currentTime,
            ),

            Text(
              description,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 20,
                color: Colors.orangeAccent
              ),
            ),
            Center(
              child:  Container(
                alignment: Alignment.center,
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
              "Get Current Location ",
              style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 21,
            fontFamily: 'monospace'
              )
            )
            ),
            TextButton(onPressed: loadData, child: const Text(
                "Temperature",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    fontFamily: 'monospace'
                )
            )
            ),
            AdditionalFeatures(response: res),




          ],
        )));
  }
}
