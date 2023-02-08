import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> Locations =[
    WorldTime(location: 'India', flag: 'india.png', url:'Asia/Kolkata'),
    WorldTime(location: 'London', flag: 'london.png', url:'Europe/London'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url:'Africa/Nairobi'),
    WorldTime(location: 'NewYork', flag: 'usa.png', url:'America/New_York'),
    WorldTime(location: 'Athens', flag: 'greece.png', url:'Europe/Berlin'),
    WorldTime(location: 'Chicago', flag: 'usa.png', url:'America/Chicago'),
  ];

  void updateTime(index) async {
    WorldTime instance = Locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title:Text('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0 , 
      ),
      body : ListView.builder(
        itemCount: Locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:3.0, horizontal:4.0),
            child: Card(
              child: ListTile(
                onTap:() {
                  updateTime(index);
                },
                title: Text(Locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('/${Locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}