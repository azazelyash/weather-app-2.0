import 'package:flutter/material.dart';
import 'package:weather_app_2/constants/constants.dart';
import 'package:weather_app_2/widgets/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstContainerData extends StatelessWidget {
  const FirstContainerData({
    super.key,
    required this.dateDay1,
    required this.iconUrlDay1,
    required this.tempDay1,
    required this.adjectiveDay1,
    required this.location,
    required this.windSpeed,
    required this.humidity,
    required this.themeColor,
    required this.themeColorText,
  });

  final String dateDay1;
  final String iconUrlDay1;
  final String tempDay1;
  final String adjectiveDay1;
  final String location;
  final String windSpeed;
  final String humidity;
  final Color themeColor;
  final Color themeColorText;

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      theHeight: 308,
      theWidth: double.infinity,
      theColor: themeColor,
      theChild: Column(
        children: <Widget>[
          /* ---------------------------------- Date ---------------------------------- */

          Text(
            dateDay1,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 18,
                color: themeColorText,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),

          /* ------------------------------- Icon & Temp ------------------------------ */

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                color: themeColorText,
                width: 72,
                image: AssetImage(iconUrlDay1),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Text(
                "$tempDay1°",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 64,
                    color: themeColorText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),

          /* -------------------------------- Adjective ------------------------------- */

          Text(
            adjectiveDay1,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 18,
                color: themeColorText,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),

          /* -------------------------------- Location -------------------------------- */

          Text(
            location,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 16,
                color: themeColorText,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Spacer(),

          /* ----------------------------- Wind & Humidity ---------------------------- */

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Wind Speed: $windSpeed",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: themeColorText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 1,
                height: 24,
                color: themeColorText,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Humidity: $humidity",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: themeColorText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
