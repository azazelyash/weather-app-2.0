import 'package:flutter/material.dart';
import 'package:weather_app_2/constants/constants.dart';

class SecondContainerDivider extends StatelessWidget {
  SecondContainerDivider({super.key, required this.themeColor});

  Color themeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 116,
      color: themeColor,
    );
  }
}
