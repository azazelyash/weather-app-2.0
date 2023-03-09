import 'package:weather_app_2/constants/constants.dart';

import 'network.dart';
import 'location.dart';

const apikey = "NKS6ELACKLS8TDE2JHLY5AEVN";
const apiURL =
    "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$apiURL$cityName?key=$apikey';

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherDataCity = await networkHelper.getData();

    return weatherDataCity;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentPosition();

    var url = '$apiURL${location.latitude},${location.longitude}?key=$apikey';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getBackgroundURL(double temp, double humidity) {
    String url = kSunny;

    if (temp >= 40) {
      url = kSunny;
    } else if (temp < 40 && temp >= 30) {
      url = kModerate;
    } else if (temp < 30 && temp >= 20) {
      if (humidity < 40) {
        url = kCloudy;
      } else {
        url = kRainy;
      }
    } else if (temp < 20 && temp >= 10) {
      url = kCold;
    } else {
      url = kSnowy;
    }

    return url;
  }

  String getIconURl(double temp, double humidity) {
    String url = kSunny;

    if (temp >= 40) {
      url = kSunnyIcon;
    } else if (temp < 40 && temp >= 30) {
      url = kModerateIcon;
    } else if (temp < 30 && temp >= 20) {
      if (humidity < 40) {
        url = kCloudyIcon;
      } else {
        url = kRainyIcon;
      }
    } else if (temp < 20 && temp >= 10) {
      url = kColdIcon;
    } else {
      url = kSnowyIcon;
    }

    return url;
  }
}
