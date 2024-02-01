// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'Europe/London', flag: 'uk.png'),
    WorldTime(
        url: 'Europe/Berlin', location: 'Europe/Berlin', flag: 'germany.png'),
    WorldTime(
        url: 'Europe/Athens', location: 'Europe/Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Africa/Cairo', flag: 'egypt.png'),
    WorldTime(
        url: 'Africa/Nairobi', location: 'Africa/Nairobi', flag: 'kenya.png'),
    WorldTime(
        url: 'America/Chicago', location: 'America/Chicago', flag: 'usa.png'),
    WorldTime(
        url: 'America/New_York', location: 'America/New York', flag: 'usa.png'),
    WorldTime(
        url: 'Asia/Seoul', location: 'Asia/Seoul', flag: 'south_korea.png'),
    WorldTime(
        url: 'Asia/Jakarta', location: 'Asia/Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    // WorldTime instance = WorldTime(
    //     location: locations[index].location,
    //     flag: locations[index].flag,
    //     url: locations[index].url);
    WorldTime instance = locations[index];
    await instance.getTime();

    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/${locations[index].flag}'),
                ),
                title: Text(locations[index].location),
              ),
            ),
          );
        },
      ),
    );
  }
}
