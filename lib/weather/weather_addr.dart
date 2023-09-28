import 'dart:convert';
import 'dart:developer';

import '../models/addr.dart';
import 'dio_utils.dart';

Future<Addr?> currentIpAddrInfo() async {
  final response = await dio.get('https://ip.useragentinfo.com/json');
  if (response.statusCode != 200) {
    log('网络地址请求失败：${response.statusMessage}');
    return null;
  }
  Addr a = Addr.fromJson(json.decode(response.data));
  return a;
}
