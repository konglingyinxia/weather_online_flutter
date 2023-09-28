import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_online/models/weather.dart';

import '../utils/utils_convert.dart';

//图标
Widget getWeatherIcon(int code) {
  switch (code) {
    case == 0:
      return Image.asset('assets/6.png');
    case == 1:
      return Image.asset('assets/7.png');
    case == 2:
      return Image.asset('assets/8.png');
    case == 3:
      return Image.asset('assets/2.png');
    case == 4:
      return Image.asset('assets/1.png');
    //雷阵雨伴冰雹
    case == 5:
      return Image.asset('assets/9.png');
    case == 6:
      return Image.asset('assets/20.png');
    //雨
    case 7 || 8 || 9 || 10 || 11 || 12 || 21 || 22 || 23 || 24 || 25:
      return Image.asset('assets/3.png');
    //雪
    case 13 || 14 || 15 || 16 || 17 || 19 || 26 || 27 || 28:
      return Image.asset('assets/4.png');
    //雾
    case 18:
      return Image.asset('assets/5.png');
    //雾霾。沙尘
    case 20 || 29 || 30 || 31 || 53:
      return Image.asset('assets/21.png');
    default:
      return Image.asset('assets/7.png');
  }
}

Widget homeWeatherView(BuildContext context, AqiForecast5days weather) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📍 ${weather.city}',
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 8),
        Text(
          getDateDesc(),
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Center(
          child: SizedBox(
            height: 200,
            width: 300,
            child: getWeatherIcon(int.parse('${weather.realtime!.wid}')),
          ),
        ),
        Center(
          child: Text(
            '${weather.realtime?.temperature} °C',
            style: const TextStyle(
                color: Colors.white, fontSize: 55, fontWeight: FontWeight.w600),
          ),
        ),
        Center(
          child: Text(
            '${weather.realtime?.info}',
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Text(
            getDateWeatherFormat(DateTime.now()),
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
          ),
        ),
        const SizedBox(height: 30),
        //_buildSunRise(context, weather),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Image.asset(
                'assets/13.png',
                scale: 8,
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '温度-高',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "${weather.realtime?.temperature} °C",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ]),
            Row(children: [
              Image.asset(
                'assets/14.png',
                scale: 8,
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '温度-低',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "${weather.realtime?.temperature} °C",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ])
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0),
          child: Divider(
            color: Color(0xf055556e),
          ),
        ),
        Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //垂直方向居中对齐
                      children: [
                        Image.asset(
                          'assets/17.png',
                          scale: 5,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${weather.realtime?.direct}:${weather.realtime?.power}",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //垂直方向居中对齐
                      children: [
                        Image.asset(
                          'assets/16.png',
                          scale: 5,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${weather.realtime?.humidity} %",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //垂直方向居中对齐
                      children: [
                        Image.asset(
                          'assets/15.png',
                          scale: 5,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${weather.realtime?.temperature} °C",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //垂直方向居中对齐
                      children: [
                        Image.asset(
                          'assets/pm22.png',
                          scale: 5,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${weather.realtime?.aqi}",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

_buildSunRise(BuildContext context, AqiForecast5days weather) {
  DateTime now = DateTime.now();
  Future future =
      Future(date: DateUtil.formatDate(now, format: DateFormats.y_mo_d));
  if (weather.future != null) {
    weather.future?.forEach((element) {
      DateTime? c = DateUtil.getDateTime('${element.date}');
      if (c != null && c.month == now.month && c.day == now.day) {
        future = element;
      }
    });
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Image.asset(
            'assets/11.png',
            scale: 8,
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '日出',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 3),
              Text(
                DateUtil.formatDate(DateTime.now(), format: DateFormats.h_m),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      ),
      Row(
        children: [
          Image.asset(
            'assets/12.png',
            scale: 8,
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '日落',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 3),
              Text(
                DateUtil.formatDate(DateTime.now(), format: DateFormats.h_m),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      ),
    ],
  );
}
