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
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
              color: Colors.greenAccent

        ),
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          colors: [
            Colors.indigo.shade900,
            Colors.green.shade900
          ]
        ),
      ),
      child:  const Text(
        "আবহাওয়া",

        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
    );
  }
}
