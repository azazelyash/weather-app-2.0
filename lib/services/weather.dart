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
}
