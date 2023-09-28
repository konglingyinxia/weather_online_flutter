// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Addr _$AddrFromJson(Map<String, dynamic> json) => Addr()
  ..country = json['country'] as String
  ..short_name = json['short_name'] as String
  ..province = json['province'] as String
  ..city = json['city'] as String
  ..area = json['area'] as String
  ..isp = json['isp'] as String
  ..net = json['net'] as String
  ..ip = json['ip'] as String
  ..code = json['code'] as num
  ..desc = json['desc'] as String;

Map<String, dynamic> _$AddrToJson(Addr instance) => <String, dynamic>{
      'country': instance.country,
      'short_name': instance.short_name,
      'province': instance.province,
      'city': instance.city,
      'area': instance.area,
      'isp': instance.isp,
      'net': instance.net,
      'ip': instance.ip,
      'code': instance.code,
      'desc': instance.desc,
    };
