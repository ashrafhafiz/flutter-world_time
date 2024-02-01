// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = 'loading';

  void setupWorldTimne() async {
    WorldTime instance = WorldTime(
        location: 'Africa/Cairo', flag: 'egypt.png', url: 'Africa/Cairo');
    await instance.getTime();
    // setState(() {
    //   time = instance.time;
    // });
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTimne();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.purple[800],
          size: 150.0,
        ),
      ),
    );
  }
}
