import 'package:covid_tracker/models/CountryInfo.dart';
import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List<CountryInfo> countriesInfoList;

  MostAffectedPanel({@required this.countriesInfoList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: <Widget>[
                  Image(
                    image:
                        NetworkImage(countriesInfoList[index].countryInfo.flag),
                    height: 30,
                    width: 50,
                  ),
                  SizedBox(width: 10),
                  Text(
                    countriesInfoList[index].country,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    countriesInfoList[index].cases.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
