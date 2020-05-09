import 'package:flutter/material.dart';

import 'package:covid_tracker/app/AppStrings.dart';

class QuoteContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      height: 100,
      child: Text(
        AppStrings.homeViewQuote,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.orange[800],
        ),
      ),
    );
  }
}
