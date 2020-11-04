import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class StatsGridGlobal extends StatefulWidget {
  @override
  _StatsGridGlobalState createState() => _StatsGridGlobalState();
}

class _StatsGridGlobalState extends State<StatsGridGlobal> {

  String global_total_cases = '0';
  String global_deaths ='0';
  String date ='0';
  String time ='0';
  String global_new_cases ='0';
  String global_new_deaths ='0';
  String global_recovered ='0';

  void getData() async {

    Response response = await get('https://hpb.health.gov.lk/api/get-current-statistical');
    Map data_api = jsonDecode(response.body);
    Map data = data_api['data'];

    setState(() {
      global_total_cases = data['global_total_cases'].toString();
      global_deaths = data['global_deaths'].toString();
      String datetime = data['update_date_time'];
      DateTime now  = DateTime.parse(datetime);
      date = DateFormat.yMd().format(now);
      time = DateFormat.jm().format(now);
      global_new_cases = data['global_new_cases'].toString();
      global_new_deaths = data['global_new_deaths'].toString();
      global_recovered = data['global_recovered'].toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20, 0, 0),
          child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        child: Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  _buildStateCard('Updated Date',date,Colors.blue),
                  _buildStateCard('Updated Time',time,Colors.green)
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  _buildStateCard('Global Total Cases',global_total_cases,Colors.orange),
                  _buildStateCard('Global Deaths',global_deaths,Colors.red)
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  _buildStateCard('Global New Cases',global_new_cases,Colors.lightGreen),
                  _buildStateCard('Global New Deaths',global_new_deaths,Colors.deepOrange),
                  _buildStateCard('Global Recovered',global_recovered,Colors.cyan),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Expanded _buildStateCard(String title , String count , MaterialColor color){

    return  Expanded(
        child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(
              count,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}