import 'package:common_utils/common_utils.dart';

//转换
String getDateWeatherFormat(DateTime? date) {
  if (date == null) {
    return "";
  }
  return '${DateUtil.getWeekday(date, languageCode: "zh", short: true)}, ${DateUtil.formatDate(date, format: DateFormats.zh_mo_d)}, ${DateUtil.formatDate(date, format: DateFormats.h_m)}';
}

String getDateDesc() {
  DateTime d = DateTime.now();
  int hour = d.hour;
  if (hour >= 21 && hour <= 4) {
    return '夜晚';
  }
  if (hour >= 18) {
    return '晚上好';
  }
  if (hour >= 13) {
    return '下午好';
  }
  if (hour >= 11) {
    return '中午好';
  }
  if (hour >= 8) {
    return '上午好';
  }
  return "早上好";
}
