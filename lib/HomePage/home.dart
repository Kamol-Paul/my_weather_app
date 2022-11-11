import 'package:flutter/material.dart';
import 'package:my_weather_app/HomePage/appBarWidget.dart';
import 'package:my_weather_app/HomePage/homeBody.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const AppBatWidget(),
      ),
      backgroundColor: Colors.green.shade400,
      body: const HomeBody(),


    );
  }
}
