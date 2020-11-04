import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      body: SafeArea(
      child: Column(
        children: [
          FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, 'location');
            },
            icon: Icon(Icons.edit_location),
            label: Text('Edit Location'),
          ),
          Text(data['time']),
          Text(data['date']),
          Text(data['local_new_cases']),
          Text(data['local_total_cases']),
          Text(data['local_total_number_of_individuals_in_hospitals']),
          Text(data['local_new_deaths']),
          Text(data['local_recovered']),
          Text(data['local_active_cases']),
        ],
      )
      ),
    );
  }
}