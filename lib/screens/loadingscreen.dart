// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:weather_app_2/constants/constants.dart';
import 'package:weather_app_2/screens/homescreen.dart';
import 'package:weather_app_2/services/location.dart';
import 'package:weather_app_2/services/weather.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestLocationPermission();
    geoLocationData();
  }

  void requestLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      print("Permission is Granted");
    } else if (status.isDenied) {
      if (await Permission.location.request().isGranted) {
        print("Permission was granted");
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void geoLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Homescreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: kCloudyColor,
        ),
      ),
    );
  }
}
