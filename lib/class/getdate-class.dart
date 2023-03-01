// ignore_for_file: camel_case_types, avoid_print

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class allcountries {
  late bool isDayTime;
  late String timeNow;
  late String timeZone;

  getData() async {
    Response receivedDataFromAPI = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Cairo'));
    Map receivedData = jsonDecode(receivedDataFromAPI.body);

    DateTime datetime = DateTime.parse(receivedData["utc_datetime"]);

    int offset = int.parse(receivedData["utc_offset"].substring(0, 3));

    DateTime realTime = datetime.add(Duration(hours: offset));
    print(realTime.hour);
    //      13                    13
    if (realTime.hour > 5 && realTime.hour < 18) {
      isDayTime = true;
    } else {
      isDayTime = false;
    }

    timeNow = DateFormat('hh:mm a').format(realTime);
    timeZone = receivedData["timezone"];
  }
}
