
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
}