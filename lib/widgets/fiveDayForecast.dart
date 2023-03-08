import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_2/constants/constants.dart';

class FiveDayForecast extends StatelessWidget {
  FiveDayForecast({
    super.key,
    required this.iconUrl,
    required this.adjective,
    required this.date,
    required this.temp,
    required this.themeColorText,
  });

  String iconUrl = "";
  String adjective = "";
  String date = "";
  String temp = "";
  Color themeColorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          date,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 12,
              color: themeColorText,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Image(
          color: themeColorText,
          width: 24,
          image: AssetImage(iconUrl),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "$temp°",
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 16,
              color: themeColorText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          adjective,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 12,
              color: themeColorText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
