import 'package:flutter/material.dart';

class AdditionalFeatures extends StatefulWidget {
  Map<String,dynamic> response;

   AdditionalFeatures({Key? key, required this.response}) : super(key: key);

  @override
  State<AdditionalFeatures> createState() => _AdditionalFeaturesState();

}

class _AdditionalFeaturesState extends State<AdditionalFeatures> {
  var humidity = "Loading",windPressure = "Loading",eyeValue = "Loading";


  @override


  void initState(){
      super.initState();
    changeState(widget.response);
  }
  void changeState(data){

    setState((){
      humidity = "${data['main']['humidity']}%";
      windPressure = data['wind']['speed'].toString();
      eyeValue = "${data['visibility']/1000.0} km";
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
             const Text("আর্দ্রতা:"),
              Text(humidity),
  ]

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text("বায়ু-চাপ:"),
              Text(windPressure)
          ]

          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text("দৃষ্টিসীমা:"),
                Text(eyeValue)
              ]

          )
        ],
      ),


    );
  }
}
