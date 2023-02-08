import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart' ;

class WorldTime {

  String location;
  String time="";
  String flag;
  String url;
  bool isDaytime=false;

  WorldTime({required this.location, required this.flag, required this.url});
  Future<void> getTime() async {
    
    try {
     //make request
      var Url =Uri.parse("http://worldtimeapi.org/api/timezone/$url");
      var response= await http.get(Url);
      Map data = jsonDecode(response.body);
    //print(data);
    //get properties from data
      String datetime =  data['datetime'];
      String offset1 = data['utc_offset'].substring(0,3);
      String offset2 = data['utc_offset'].substring(4,6);

    //print(datetime);
    //print(offset);    

    //Create DateTime Object
      DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours:int.parse(offset1),minutes:int.parse(offset2)));
   //set the time property
      isDaytime = now.hour>6 && now.hour<19 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e) {
      print('Home.dart error: $e');
      time='could not get time';
    }
   
  }
}