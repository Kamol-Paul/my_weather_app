import 'package:flutter/material.dart';

class AppBatWidget extends StatefulWidget {
  const AppBatWidget({Key? key}) : super(key: key);

  @override
  State<AppBatWidget> createState() => _AppBatWidgetState();
}

class _AppBatWidgetState extends State<AppBatWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      child:  const Text(
        "Weather App",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
