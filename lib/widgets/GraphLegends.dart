import 'package:flutter/material.dart';
import 'package:covid_tracker/app/AppStrings.dart';

class GraphLegends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.blue,
          width: 20,
          height: 20,
        ),
        SizedBox(width: 10),
        Text(AppStrings.confirmed),
        SizedBox(width: 10),
        Container(
          color: Colors.green,
          width: 20,
          height: 20,
        ),
        SizedBox(width: 10),
        Text(AppStrings.recovered),
        SizedBox(width: 10),
        Container(
          color: Colors.red,
          width: 20,
          height: 20,
        ),
        SizedBox(width: 10),
        Text(AppStrings.deaths),
      ],
    );
  }
}
