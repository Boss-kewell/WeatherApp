//ignore_for_file: file_names, unused_import

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weatherModel.dart';

class WeatherData{
  Future<WeatherModel> getData() async{
    var uriCall = Uri.parse('http://api.weatherapi.com/v1/current.json?key=4bce3c7a03b64d6f99a00104231409&q=Cyprus&aqi=no=');
    var response = await http.get(uriCall);
    print('>>>>>>>>>>>>>>> ${response.body}');
    var body = jsonDecode(response.body);
    return WeatherModel.fromJson(body);
  }
}