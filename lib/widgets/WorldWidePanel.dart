import 'package:covid_tracker/app/AppStrings.dart';
import 'package:covid_tracker/widgets/StatusPanel.dart';
import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final int confirmedPanelValues;
  final int activePanelValues;
  final int recoveredPanelValues;
  final int deathPanelValues;

  WorldWidePanel({
    @required this.confirmedPanelValues,
    @required this.activePanelValues,
    @required this.recoveredPanelValues,
    @required this.deathPanelValues,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
            Colors.red[100],
            Colors.red,
            AppStrings.confirmed,
            confirmedPanelValues,
          ),
          StatusPanel(
            Colors.blue[100],
            Colors.blue[900],
            AppStrings.active,
            activePanelValues,
          ),
          StatusPanel(
            Colors.green[100],
            Colors.green,
            AppStrings.recovered,
            recoveredPanelValues,
          ),
          StatusPanel(
            Colors.grey[400],
            Colors.grey[900],
            AppStrings.deaths,
            deathPanelValues,
          )
        ],
      ),
    );
  }
}
