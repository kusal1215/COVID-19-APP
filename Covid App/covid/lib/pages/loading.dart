import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
 
  void getData() async {

    Response response = await get('https://hpb.health.gov.lk/api/get-current-statistical');
    Map data_api = jsonDecode(response.body);
    Map data = data_api['data'];
    String time;
    String date;

    String datetime = data['update_date_time'];
    // print(datetime);

    DateTime now  = DateTime.parse(datetime);
    print(data['local_new_cases']);

    time = DateFormat.jm().format(now);
    date = DateFormat.yMd().format(now);

    print('kusal :'+ time);
    print('date:'+ date);

    Navigator.pushReplacementNamed(context, '/statscreen',arguments: {
      'time' :time.toString(),
      'date' :date.toString(),
      'local_new_cases' : data['local_new_cases'].toString(),
      'local_total_cases' :data['local_total_cases'].toString() ,
      'local_total_number_of_individuals_in_hospitals' : data['local_total_number_of_individuals_in_hospitals'].toString(),
      'local_deaths' :data['local_deaths'].toString(),
      'local_new_deaths' :data['local_new_deaths'].toString(),
      'local_recovered' :data['local_recovered'].toString(),
      'local_active_cases' :data['local_active_cases'].toString(),
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Text('Loading')
      ),
    );
  }
}