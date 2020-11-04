import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class StatsGrid extends StatefulWidget {
  @override
  _StatsGridState createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {

  String local_total_cases = '0';
  String local_deaths ='0';
  String date ='0';
  String time ='0';
  String local_new_cases ='0';
  String local_new_deaths ='0';
  String local_recovered ='0';
  String local_active_cases ='0';

  void getData() async {

    Response response = await get('https://hpb.health.gov.lk/api/get-current-statistical');
    Map data_api = jsonDecode(response.body);
    Map data = data_api['data'];

    setState(() {
      local_total_cases = data['local_total_cases'].toString();
      local_deaths = data['local_deaths'].toString();
      String datetime = data['update_date_time'];
      DateTime now  = DateTime.parse(datetime);
      date = DateFormat.yMd().format(now);
      time = DateFormat.jm().format(now);
      local_new_cases = data['local_new_cases'].toString();
      local_new_deaths = data['local_new_deaths'].toString();
      local_recovered = data['local_recovered'].toString();
      local_active_cases = data['local_active_cases'].toString();
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
                  _buildStateCard('Local Total Cases',local_total_cases,Colors.orange),
                  _buildStateCard('Local Deaths',local_deaths,Colors.red)
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  _buildStateCard('Local New Cases',local_new_cases,Colors.lightGreen),
                  _buildStateCard('Local New Deaths',local_new_deaths,Colors.deepOrange),
                  _buildStateCard('Local Recovered',local_recovered,Colors.cyan),
                  _buildStateCard('Local Active Ceses',local_active_cases,Colors.purple),
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