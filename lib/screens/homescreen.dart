import 'package:flutter/material.dart';
import 'package:weather_app_2/constants/constants.dart';
import 'package:weather_app_2/services/weather.dart';
import 'package:weather_app_2/widgets/firstContainerData.dart';
import 'package:weather_app_2/widgets/fiveDayForecast.dart';
import 'package:weather_app_2/widgets/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_2/widgets/secondContainerDivider.dart';
import 'package:intl/intl.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key, this.locationWeather});

  final locationWeather;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  WeatherModel weather = WeatherModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  String convertToCelcius(double temp) {
    String out = ((temp - 32) / 1.8).toStringAsFixed(2);
    return out;
  }

  String? searchBarText;

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
  String description = "";

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

  /* --------------------------- Update UI Function --------------------------- */

  void updateUI(dynamic weatherData) {
    setState(() {
      /* ---------------------------- Update Data Day1 ---------------------------- */

      DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss")
          .parse(weatherData["days"][0]["datetime"] + " 00:00:00");
      dateDay1 = DateFormat('yMMMMd').format(tempDate).toString();
      tempDay1 = convertToCelcius(weatherData["days"][0]["temp"]);
      humidity = weatherData["days"][0]["humidity"].toString();
      windSpeed = weatherData["days"][0]["windspeed"].toString();
      location = weatherData["timezone"];
      description = weatherData["description"];

      /* ---------------------------- Update Data Day2 ---------------------------- */

      tempDate = DateFormat("yyyy-MM-dd hh:mm:ss")
          .parse(weatherData["days"][1]["datetime"] + " 00:00:00");
      dateDay2 = DateFormat('Md').format(tempDate).toString();
      tempDay2 = convertToCelcius(weatherData["days"][1]["temp"]);

      /* ---------------------------- Update Data Day3 ---------------------------- */

      tempDate = DateFormat("yyyy-MM-dd hh:mm:ss")
          .parse(weatherData["days"][2]["datetime"] + " 00:00:00");
      dateDay3 = DateFormat('Md').format(tempDate).toString();
      tempDay3 = convertToCelcius(weatherData["days"][2]["temp"]);

      /* ---------------------------- Update Data Day4 ---------------------------- */

      tempDate = DateFormat("yyyy-MM-dd hh:mm:ss")
          .parse(weatherData["days"][3]["datetime"] + " 00:00:00");
      dateDay4 = DateFormat('Md').format(tempDate).toString();
      tempDay4 = convertToCelcius(weatherData["days"][3]["temp"]);

      /* ---------------------------- Update Data Day5 ---------------------------- */

      tempDate = DateFormat("yyyy-MM-dd hh:mm:ss")
          .parse(weatherData["days"][4]["datetime"] + " 00:00:00");
      dateDay5 = DateFormat('Md').format(tempDate).toString();
      tempDay5 = convertToCelcius(weatherData["days"][4]["temp"]);

      /* ---------------------------- Update Data Day6 ---------------------------- */

      tempDate = DateFormat("yyyy-MM-dd hh:mm:ss")
          .parse(weatherData["days"][5]["datetime"] + " 00:00:00");
      dateDay6 = DateFormat('Md').format(tempDate).toString();
      tempDay6 = convertToCelcius(weatherData["days"][5]["temp"]);
    });
  }

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

                        /* --------------------------- Searchbar Function --------------------------- */

                        onPressed: () async {
                          if (searchBarText != null) {
                            var weatherData =
                                await weather.getCityWeather(searchBarText!);
                            updateUI(weatherData);
                          }
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
                          description,
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
