// ignore_for_file: avoid_print, unused_import, prefer_const_constructors, sort_child_properties_last, unused_local_variable, use_build_context_synchronously, prefer_const_literals_to_create_immutables, duplicate_ignore
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:time_world_app/class/getdate-class.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDatalodingpage() async {
    late bool isDayTime;

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
    allcountries onecountry = allcountries();
    await onecountry.getData();

    String timeNow = DateFormat('hh:mm a').format(realTime);
    String timeZone = receivedData["timezone"];

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "time": onecountry.timeNow,
      "location": onecountry.timeZone,
      "isDayTime": onecountry.isDayTime
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getDatalodingpage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Color.fromARGB(146, 12, 16, 49),
              size: 160.0,
            )
          ],
        ),
      ),
    );
  }
}
