import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_online/bloc/weather_bloc_bloc.dart';
import 'package:weather_online/views/common_views.dart';
import 'package:weather_online/views/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _daterminePosition(),
        builder: (context, snap) {
          if (snap.hasData) {
            return BlocProvider<WeatherBlocBloc>(
              create: (context) => WeatherBlocBloc(context)
                ..add(FetchWeather(snap.data as Position)),
              child: const HomeView(),
            );
          } else {
            return Scaffold(
                backgroundColor: Colors.black,
                extendBodyBehindAppBar: true,
                appBar: globalAppBar,
                body: Padding(
                  padding:
                      const EdgeInsets.fromLTRB(30, 1 * kToolbarHeight, 30, 20),
                  child: Stack(
                    children: [
                      ...backgrounds,
                      const Center(
                        child: CircularProgressIndicator(
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ));
          }
        },
      ),
    );
  }
}

Future<Position> _daterminePosition() async {
  bool serviceEnabled;
  LocationPermission? permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('定位服务未启用');
  }
  //获取权限
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('定位服务被禁用');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error('定位服务器未授权！');
  }

  return await Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
}
