// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(
          Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);
      DateTime now = DateTime.parse(data['dateTime']);

      // time = now.toString();
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Couldn\'t get time';
    }
  }
}
