import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/weather.dart';
import 'dio_utils.dart';

queryWeather(String city) async {
  city = city.replaceAll("市", '');
  final formData = FormData.fromMap({
    'city': city,
    'weatherTypes': '1,2',
    'apiKey': '1',
    'deviceId': '1',
  });
  String url = 'http://utils.mzydz.com/api/apiData/juHeData/getJuHeWeather';
  final response = await dio.post(url, data: formData);
  Weather weather = Weather.fromJson(response.data);
  return weather;
}
main() async {
   Weather w = await queryWeather("郑州");
   print(w);
}
