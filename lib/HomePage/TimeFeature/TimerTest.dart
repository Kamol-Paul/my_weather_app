
import 'package:intl/intl.dart';

class TimerTest{
  String getCurrentDate(){
    DateTime dateTime = DateTime.now();
    return DateFormat.MMMMEEEEd().format(dateTime);
    //return "alu";
  }
  String getCurrentTime(){
    DateTime dateTime = DateTime.now();
    return DateFormat.jms().format(dateTime);
  }

  static String getTimeFromInt(String time){
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(time)*1000);
    return DateFormat.jms().format(dateTime);
  }
}