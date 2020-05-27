import 'package:covid_tracker/app/AppStrings.dart';
import 'package:covid_tracker/views/CountryStatsView.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  final String countryName;
  final String countryCode;
  final String flagUrl;
  final int confirmedCount;
  final int confirmedTodayCount;
  final int activeCount;
  final int recoveredCount;
  final int deathCount;
  final int deathTodayCount;

  CountryCard(
    this.countryName,
    this.countryCode,
    this.flagUrl,
    this.confirmedCount,
    this.confirmedTodayCount,
    this.activeCount,
    this.recoveredCount,
    this.deathCount,
    this.deathTodayCount,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountryStatsView(countryCode, countryName),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      countryName,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image(
                      image: NetworkImage(flagUrl),
                      height: 50,
                      width: 100,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      AppStrings.confirmed + ": " + confirmedCount.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "[+" + confirmedTodayCount.toString() + "]",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppStrings.active + ": " + activeCount.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppStrings.recovered + ": " + recoveredCount.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppStrings.deaths +
                          ": " +
                          deathCount.toString() +
                          " " +
                          "[+" +
                          deathTodayCount.toString() +
                          "]",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
