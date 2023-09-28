import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_online/weather/weather_factory.dart';
import '../models/addr.dart';
import '../models/weather.dart';
import '../weather/weather_addr.dart';

part 'weather_bloc_event.dart';

part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc(BuildContext context) : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        Addr? addr = await currentIpAddrInfo();
        log('获取地址：$addr');
        String? city = '郑州';
        if (addr != null) {
          city = addr.city;
        }
        Weather w = await queryWeather(city);
        log('获取天气：$w');
        if (w.code == 0) {
          emit(WeatherBlocSuccess(w.data!));
        } else {
          emit(WeatherBlocFailure());
        }
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}
