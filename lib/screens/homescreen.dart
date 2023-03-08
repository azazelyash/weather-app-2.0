import 'package:flutter/material.dart';
import 'package:weather_app_2/constants/constants.dart';
import 'package:weather_app_2/widgets/firstContainerData.dart';
import 'package:weather_app_2/widgets/fiveDayForecast.dart';
import 'package:weather_app_2/widgets/glassmorphism.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_2/widgets/secondContainerDivider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String searchBarText = "";

  /* ---------------------------------- Theme --------------------------------- */

  String imageUrl = "assets/backgrounds/cloudy.png";
  Color themeColor = kCloudyColor;
  Color themeColorText = kCloudyColorText;
  Color searchBarBackground = kCloudyColorText;
  Color searchBarIconColor = kCloudyColor;
  Color searchBarButtonColor = kCloudyColor.withOpacity(1);

  /* ------------------------------- Day 1 Data ------------------------------- */

  String dateDay1 = "08 Mar, 2023";
  String tempDay1 = "25";
  String iconUrlDay1 = "assets/icons/sunny.png";
  String adjectiveDay1 = "Hot";
  String location = "Noida, India";
  String windSpeed = "8.8";
  String humidity = "88.6";

  /* ------------------------------- Day 2 Data ------------------------------- */

  String dateDay2 = "08/03";
  String tempDay2 = "25";
  String iconUrlDay2 = "assets/icons/sunny.png";
  String adjectiveDay2 = "Hot";

  /* ------------------------------- Day 3 Data ------------------------------- */

  String dateDay3 = "09/03";
  String tempDay3 = "25";
  String iconUrlDay3 = "assets/icons/sunny.png";
  String adjectiveDay3 = "Hot";

  /* ------------------------------- Day 4 Data ------------------------------- */

  String dateDay4 = "10/03";
  String tempDay4 = "25";
  String iconUrlDay4 = "assets/icons/sunny.png";
  String adjectiveDay4 = "Hot";

  /* ------------------------------- Day 5 Data; ------------------------------ */

  String dateDay5 = "11/03";
  String tempDay5 = "25";
  String iconUrlDay5 = "assets/icons/sunny.png";
  String adjectiveDay5 = "Hot";

  /* ------------------------------- Day 6 Data ------------------------------- */

  String dateDay6 = "12/03";
  String tempDay6 = "25";
  String iconUrlDay6 = "assets/icons/sunny.png";
  String adjectiveDay6 = "Hot";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ---------------------------- Background Image ---------------------------- */

      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),

        /* ------------------------------ Content Area ------------------------------ */

        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
              child: Column(
                children: <Widget>[
                  /* ------------------------------- Search Bar ------------------------------- */

                  TextFormField(
                    onChanged: (value) {
                      searchBarText = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      hintText: "Search",
                      suffixIcon: FloatingActionButton(
                        backgroundColor: searchBarBackground,
                        onPressed: () {
                          print(searchBarText);
                        },
                        child: Icon(
                          Icons.search,
                          color: searchBarIconColor,
                        ),
                      ),
                      hintStyle: const TextStyle(fontWeight: FontWeight.w500),
                      filled: true,
                      fillColor: searchBarButtonColor,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  /* ----------------------------- First Container ---------------------------- */

                  FirstContainerData(
                    dateDay1: dateDay1,
                    iconUrlDay1: iconUrlDay1,
                    tempDay1: tempDay1,
                    adjectiveDay1: adjectiveDay1,
                    location: location,
                    windSpeed: windSpeed,
                    humidity: humidity,
                    themeColor: themeColor,
                    themeColorText: themeColorText,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  /* ---------------------------- Second Container ---------------------------- */

                  GlassMorphism(
                    theHeight: 175,
                    theWidth: double.infinity,
                    theColor: themeColor,
                    theChild: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FiveDayForecast(
                          iconUrl: iconUrlDay2,
                          date: dateDay2,
                          temp: tempDay2,
                          adjective: adjectiveDay2,
                          themeColorText: themeColorText,
                        ),
                        const SecondContainerDivider(),
                        FiveDayForecast(
                          iconUrl: iconUrlDay3,
                          date: dateDay3,
                          temp: tempDay3,
                          adjective: adjectiveDay3,
                          themeColorText: themeColorText,
                        ),
                        const SecondContainerDivider(),
                        FiveDayForecast(
                          iconUrl: iconUrlDay4,
                          date: dateDay4,
                          temp: tempDay4,
                          adjective: adjectiveDay4,
                          themeColorText: themeColorText,
                        ),
                        const SecondContainerDivider(),
                        FiveDayForecast(
                          iconUrl: iconUrlDay5,
                          date: dateDay5,
                          temp: tempDay5,
                          adjective: adjectiveDay5,
                          themeColorText: themeColorText,
                        ),
                        const SecondContainerDivider(),
                        FiveDayForecast(
                          iconUrl: iconUrlDay6,
                          date: dateDay6,
                          temp: tempDay6,
                          adjective: adjectiveDay6,
                          themeColorText: themeColorText,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  /* ----------------------------- Third Container ---------------------------- */

                  GlassMorphism(
                    theHeight: 140,
                    theWidth: double.infinity,
                    theColor: themeColor,
                    theChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        /* ------------------------------ "Description" ----------------------------- */
                        Text(
                          "Description",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: themeColorText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),

                        /* ----------------------------- Decription Text ---------------------------- */

                        Text(
                          "Congratulations! We are pleased to inform you that you have been shortlisted for the next stage of our hiring process.",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: themeColorText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
