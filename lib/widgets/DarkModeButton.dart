import 'package:covid_tracker/providers/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkModeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _mainProvider = Provider.of<MainProvider>(context);
    return AnimatedOpacity(
      opacity: _mainProvider.darkModeStatus ? 0.3 : 1.0,
      duration: Duration(milliseconds: 1000),
      child: IconButton(
        icon: Icon(
          Icons.lightbulb_outline,
        ),
        onPressed: () {
          _mainProvider.darkModeStatus = !_mainProvider.darkModeStatus;
        },
      ),
    );
  }
}
