// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 191, 199),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(146, 12, 16, 49),
        title: Text(
          "Choose Location",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context, {
                      "time ": "01.30",
                      "location": "tunes",
                      "isDayTime": true
                    });
                  },
                  title: Text(
                    "Egypt - Cairo",
                    style: TextStyle(fontSize: 22),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/egypt.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
