import 'package:covid_tracker/app/AppStrings.dart';
import 'package:covid_tracker/widgets/loadingAnimation.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';

import 'package:covid_tracker/models/CountryInfo.dart';
import 'package:covid_tracker/providers/HomeProvider.dart';
import 'package:covid_tracker/widgets/MostAffectedHeader.dart';
import 'package:covid_tracker/widgets/MostAffectedPanel.dart';
import 'package:covid_tracker/widgets/QuoteContainer.dart';
import 'package:covid_tracker/widgets/WorldWideHeader.dart';
import 'package:covid_tracker/widgets/WorldWidePanel.dart';

class GeneralView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          QuoteContainer(AppStrings.homeViewQuote),
          WorldWideHeader(),
          Selector<HomeProvider, Tuple4<int, int, int, int>>(
            selector: (_, homeProvider) => Tuple4(
              homeProvider.globalVirusInfo.cases,
              homeProvider.globalVirusInfo.active,
              homeProvider.globalVirusInfo.recovered,
              homeProvider.globalVirusInfo.deaths,
            ),
            builder: (_, globalVirusInfo, __) {
              return globalVirusInfo.item1 == 0
                  ? Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: LoadingAnimation(),
                      ),
                    )
                  : WorldWidePanel(
                      confirmedPanelValues: globalVirusInfo.item1,
                      activePanelValues: globalVirusInfo.item2,
                      recoveredPanelValues: globalVirusInfo.item3,
                      deathPanelValues: globalVirusInfo.item4,
                    );
            },
          ),
          MostAffectedHeader(),
          Selector<HomeProvider, Tuple2<List<CountryInfo>, int>>(
            selector: (_, homeProvider) => Tuple2(
                homeProvider.countriesInfo, homeProvider.countriesInfo.length),
            builder: (_, countriesInfo, __) {
              return countriesInfo.item2 == 0
                  ? Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: LoadingAnimation(),
                      ),
                    )
                  : MostAffectedPanel(countriesInfoList: countriesInfo.item1);
            },
          ),
        ],
      ),
    );
  }
}
