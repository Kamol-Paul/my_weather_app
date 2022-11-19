import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_weather_app/HomePage/GetData/getData.dart';
import 'package:my_weather_app/HomePage/GetData/CelToFar.dart';
import 'package:my_weather_app/HomePage/LocationData/GetLocationData.dart';
import 'package:my_weather_app/HomePage/TimeFeature/AdditionalFeature.dart';
import 'package:my_weather_app/HomePage/TimeFeature/TimerTest.dart';
import 'package:weather_icons/weather_icons.dart';

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
  var icon = "10d";
  var date = "current date", currentTime = "current time";
  void setDate() {
    setState(() {
      date = dateUpdate.getCurrentDate();
    });
  }

  void setTime() {
    setState(() {
      currentTime = dateUpdate.getCurrentTime();
    });
  }

  TextEditingController textEditingController = TextEditingController();

  void getWeather() async {
    var machine = WeatherInformationMachine();
    Map<String, dynamic> response =
        await machine.getDataWithCity(textEditingController.text);
    if (response["cod"] == 200) {
      double tempDegree = response['main']['temp'] - 273;
      double farData = converter.getFar(tempDegree);

      setState(() {
        location = "In location ${response['name']}";
        far = farData.toStringAsPrecision(2);
        tempData = tempDegree.toStringAsPrecision(2);
        description = response['weather'][0]['description'];
        res = response;
        icon = response['weather'][0]['icon'];
      });
    }
  }

  void loadData() async {
    Map<String, dynamic> response =
        await GetLocationData.getResponseForCurrentLocation();
    if (response["cod"] == 200) {
      double tempDegree = response['main']['temp'] - 273;
      double farData = converter.getFar(tempDegree);

      setState(() {
        tempData = tempDegree.toStringAsPrecision(2);
        far = farData.toStringAsPrecision(2);
        location = "Current Location ${response['name']}";
        description = response['weather'][0]['description'];
        res = response;
        icon = response['weather'][0]['icon'];
      });
    }
  }

  void setTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setTime();
      setDate();
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
    setTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Container(
        decoration:  BoxDecoration(
          color: Colors.greenAccent,
          border: Border.all(
            color: Colors.greenAccent.shade700,
            width: 3
          ),
        ),
          alignment: Alignment.topCenter,

          child: Center(
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
              Opacity(
                opacity: 0.5,
                child: Container(
                  //color: Colors.blue.shade300,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    borderRadius:  BorderRadius.circular(20),
                    border: Border.all(
                      width: 1
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const SizedBox(
                          width: 30, child: Icon(WeatherIcons.thermometer)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(tempData.toString() + degree,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.normal,
                                fontSize: 40,
                              )),
                          const SizedBox(
                            width: 40,
                          ),
                          Text(far.toString() + degreeF,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.normal,
                                fontSize: 40,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                date,
              ),
              Text(
                currentTime,
              ),
              Opacity(
                opacity: 0.8,
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    border: Border.all(
                      color: Colors.cyan,
                      width: 1,
                      style: BorderStyle.solid
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    description,
                    style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 20,
                        color: Colors.orangeAccent),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    borderRadius:  BorderRadius.circular(20),
                    border: Border.all(
                        width: 1
                    )
                ),
                child: Image.network("http://openweathermap.org/img/wn/$icon@2x.png"),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  child: TextField(
                    controller: textEditingController,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.red,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: getWeather,
                  child: Text(
                    search,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Opacity(
                opacity: 0.7,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade400,
                    border: Border.all(
                      width: 2
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15))

                  ),
                  child: TextButton(
                      onPressed: loadData,
                      child: const Text("Current Location Temperature",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'monospace'))),
                ),
              ),
              AdditionalFeatures(response: res),
            ],
          ))),
    );
  }
}
