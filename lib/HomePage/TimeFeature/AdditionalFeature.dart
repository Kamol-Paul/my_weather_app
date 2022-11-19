import 'package:flutter/material.dart';

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
    return SizedBox(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
             const Text("আর্দ্রতা: "),
              Text("${widget.response['main']['humidity']}%"),
  ]

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text("বায়ু-চাপ:"),
              Text(widget.response['wind']['speed'].toString())
          ]

          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text("দৃষ্টিসীমা:"),
                Text("${widget.response['visibility']/1000} km")
              ]

          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Text("সূর্যদয়"),
                Text("সূর্যাস্ত")
              ]

          ),
          Row(
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
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(TimerTest.getTimeFromInt(widget.response['sys']['sunrise'].toString())),
                Text(TimerTest.getTimeFromInt(widget.response['sys']['sunset'].toString())),
              ]

          )
        ],
      ),


    );
  }
}
