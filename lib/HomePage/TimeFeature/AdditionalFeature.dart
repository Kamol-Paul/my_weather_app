import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

import 'TimerTest.dart';

class AdditionalFeatures extends StatefulWidget {
  Map<String,dynamic> response;
   AdditionalFeatures({Key? key, required this.response, }) : super(key: key);

  @override
  State<AdditionalFeatures> createState() => _AdditionalFeaturesState();

}

class _AdditionalFeaturesState extends State<AdditionalFeatures> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
      //padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.greenAccent.shade700,
          width: 3
        ),
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.green.shade700,
            Colors.blue.shade700
          ]
        ),
      ),
      child: SizedBox(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green.shade700,
                      Colors.blue.shade700
                    ]
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                 Row(
                   children: const [
                     Text("আর্দ্রতা"),
                     Icon(WeatherIcons.humidity),
                   ],
                 ),
                  Text("${widget.response['main']['humidity']}%"),
  ]

              ),
            ),
            Container(
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green.shade700,
                      Colors.blue.shade700
                    ]
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: const [
                      Text("বায়ু-চাপ"),
                      Icon(WeatherIcons.wind_deg_45)
                    ],
                  ),
                  Text(widget.response['wind']['speed'].toString())
              ]

              ),
            ),
            Container(
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green.shade700,
                      Colors.blue.shade700
                    ]
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.green.shade700,
                        Colors.blue.shade700
                      ]
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: const [
                          Text("দৃষ্টিসীমা"),
                          Icon(WeatherIcons.fog)
                        ],
                      ),
                      Text("${widget.response['visibility']/1000} km")
                    ]

                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green.shade700,
                      Colors.blue.shade700
                    ]
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    Text("সূর্যদয়"),
                    Text("সূর্যাস্ত")
                  ]

              ),
            ),
            Container(
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green.shade700,
                      Colors.blue.shade700
                    ]
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[

                  SizedBox(
                    height: 75,
                    width: 75,
                    child: Image(
                      image: AssetImage('images/sunRise.jpg'),
                      height: 75,
                      width: 50,
                    ),
                  ),
                  SizedBox(
                    height: 75,
                    width: 75,
                    child: Image(
                      image: AssetImage('images/sunSet.jpg'),
                      height: 75,
                      width: 50,
                    ),
                  ),

                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green.shade700,
                      Colors.blue.shade700
                    ]
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(TimerTest.getTimeFromInt(widget.response['sys']['sunrise'].toString())),
                    Text(TimerTest.getTimeFromInt(widget.response['sys']['sunset'].toString())),
                  ]

              ),
            )
          ],
        ),


      ),
    );
  }
}
