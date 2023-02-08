import 'dart:ui';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};
  
  @override
  Widget build(BuildContext context) {

  data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

  //set background
  String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
  Color ? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
        child: Container(
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('/$bgImage'),
               fit: BoxFit.cover,
            ),
           ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget> [
              TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data= {
                       'time' : result['time'],
                       'location' : result['location'],
                      'isDaytime' : result['isDaytime'],
                      'flag' : result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color:Colors.red[100],
                  ),
                  label: Text(
                    'Edit Location',
                    style:TextStyle(
                      color:Colors.red[100],
                    ),
                    ),
                  
                ),
                SizedBox(height:20.0),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children:<Widget> [
                    Text(
                      data['location'],
                      style:TextStyle(
                        fontSize:28.0,
                        letterSpacing:2.0,
                        color: Colors.yellow[100],
                      ),
                    ),
                  ],
                ),
                SizedBox(height:20.0),
                Text(
                  data['time'],
                    style:TextStyle(
                      fontSize:56.0,
                      letterSpacing:2.0,
                       color: Colors.yellow[100],
                      ),
                ),
              ],
            ),
          ),
        ),
        ),
    );
  }
}