import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<Widget> backgrounds = [
  Align(
    alignment: const AlignmentDirectional(0, 0.3),
    child:SizedBox(
        height: 300,
        width: 300,
        child: Container(
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF9600D7)),
    )),
  ),
  Align(
    alignment: const AlignmentDirectional(0, -.1),
    child: SizedBox(
        height: 300,
        width: 300,
        child: Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFF0930CC)),
        )),
  ),
  Align(
    alignment: const AlignmentDirectional(0, -.4),
    child: SizedBox(
        height: 300,
        width: 300,
        child: Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFFF30AE3)),
        )),
  ),
  Align(
      alignment: const AlignmentDirectional(0, -1.2),
      child: SizedBox(
        height: 300,
        width: 300,
        child: Container(
          decoration: const BoxDecoration(color: Color(0xFFFFCC00)),
        ),
      )),
  BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 300.0),
    child: Container(
      decoration: const BoxDecoration(color: Colors.transparent),
    ),
  ),
];
//全局
AppBar globalAppBar = AppBar(
  backgroundColor: Colors.transparent,
  elevation: 100,
  systemOverlayStyle:
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
);
