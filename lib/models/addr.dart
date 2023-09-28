import 'package:json_annotation/json_annotation.dart';

part 'addr.g.dart';

@JsonSerializable()
class Addr {
  Addr();

  late String country;
  late String short_name;
  late String province;
  late String city;
  late String area;
  late String isp;
  late String net;
  late String ip;
  late num code;
  late String desc;
  
  factory Addr.fromJson(dynamic json) => _$AddrFromJson(json);
  Map<String, dynamic> toJson() => _$AddrToJson(this);
}
