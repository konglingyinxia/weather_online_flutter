import 'dart:convert';
/// msg : "操作成功"
/// code : 0
/// data : {"AQI_FORECAST_5DAYS":{"realtime":{"wid":"00","temperature":"21","direct":"东北风","aqi":"46","humidity":"73","power":"2级","info":"晴"},"city":"郑州","future":[{"date":"2023-09-28","wid":{"night":"07","day":"07"},"temperature":"16/25℃","weather":"小雨","direct":"东北风转西北风"},{"date":"2023-09-29","wid":{"night":"01","day":"02"},"temperature":"16/26℃","weather":"阴转多云","direct":"西南风"},{"date":"2023-09-30","wid":{"night":"01","day":"01"},"temperature":"16/26℃","weather":"多云","direct":"东北风"},{"date":"2023-10-01","wid":{"night":"07","day":"02"},"temperature":"16/23℃","weather":"阴转小雨","direct":"东风转南风"},{"date":"2023-10-02","wid":{"night":"07","day":"07"},"temperature":"13/21℃","weather":"小雨","direct":"南风"}]},"INDEX_OF_LIVING":{"city":"郑州","life":{"yundong":{"des":"有降水，推荐您在室内进行健身休闲运动；若坚持户外运动，须注意携带雨具并注意避雨防滑。","v":"较不宜"},"chuanyi":{"des":"建议着长袖T恤、衬衫加单裤等服装。年老体弱者宜着针织长袖衬衫、马甲和长裤。","v":"舒适"},"xiche":{"des":"不宜洗车，未来24小时内有雨，如果在此期间洗车，雨水和路上的泥水可能会再次弄脏您的爱车。","v":"不宜"},"diaoyu":{"des":"天气不好，不适合垂钓。","v":"不宜"},"kongtiao":{"des":"您将感到很舒适，一般不需要开启空调。","v":"较少开启"},"daisan":{"des":"有降水，请带上雨伞，如果你喜欢雨中漫步，享受大自然给予的温馨和快乐，在短时间外出可收起雨伞。","v":"带伞"},"guomin":{"des":"天气条件极易诱发过敏，有降水，易过敏人群尽量减少外出，如需外出最好穿长衣长裤，预防感冒可能引发的过敏。","v":"极易发"},"ganmao":{"des":"各项气象条件适宜，无明显降温过程，发生感冒机率较低。","v":"少发"},"ziwaixian":{"des":"属弱紫外线辐射天气，无需特别防护。若长期在户外，建议涂擦SPF在8-12之间的防晒护肤品。","v":"最弱"},"shushidu":{"des":"白天不太热也不太冷，风力不大，相信您在这样的天气条件下，应会感到比较清爽和舒适。","v":"舒适"}}}}

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));
String weatherToJson(Weather data) => json.encode(data.toJson());
class Weather {
  Weather({
      String? msg, 
      num? code, 
      Data? data,}){
    _msg = msg;
    _code = code;
    _data = data;
}

  Weather.fromJson(dynamic json) {
    _msg = json['msg'];
    _code = json['code'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _msg;
  num? _code;
  Data? _data;
Weather copyWith({  String? msg,
  num? code,
  Data? data,
}) => Weather(  msg: msg ?? _msg,
  code: code ?? _code,
  data: data ?? _data,
);
  String? get msg => _msg;
  num? get code => _code;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// AQI_FORECAST_5DAYS : {"realtime":{"wid":"00","temperature":"21","direct":"东北风","aqi":"46","humidity":"73","power":"2级","info":"晴"},"city":"郑州","future":[{"date":"2023-09-28","wid":{"night":"07","day":"07"},"temperature":"16/25℃","weather":"小雨","direct":"东北风转西北风"},{"date":"2023-09-29","wid":{"night":"01","day":"02"},"temperature":"16/26℃","weather":"阴转多云","direct":"西南风"},{"date":"2023-09-30","wid":{"night":"01","day":"01"},"temperature":"16/26℃","weather":"多云","direct":"东北风"},{"date":"2023-10-01","wid":{"night":"07","day":"02"},"temperature":"16/23℃","weather":"阴转小雨","direct":"东风转南风"},{"date":"2023-10-02","wid":{"night":"07","day":"07"},"temperature":"13/21℃","weather":"小雨","direct":"南风"}]}
/// INDEX_OF_LIVING : {"city":"郑州","life":{"yundong":{"des":"有降水，推荐您在室内进行健身休闲运动；若坚持户外运动，须注意携带雨具并注意避雨防滑。","v":"较不宜"},"chuanyi":{"des":"建议着长袖T恤、衬衫加单裤等服装。年老体弱者宜着针织长袖衬衫、马甲和长裤。","v":"舒适"},"xiche":{"des":"不宜洗车，未来24小时内有雨，如果在此期间洗车，雨水和路上的泥水可能会再次弄脏您的爱车。","v":"不宜"},"diaoyu":{"des":"天气不好，不适合垂钓。","v":"不宜"},"kongtiao":{"des":"您将感到很舒适，一般不需要开启空调。","v":"较少开启"},"daisan":{"des":"有降水，请带上雨伞，如果你喜欢雨中漫步，享受大自然给予的温馨和快乐，在短时间外出可收起雨伞。","v":"带伞"},"guomin":{"des":"天气条件极易诱发过敏，有降水，易过敏人群尽量减少外出，如需外出最好穿长衣长裤，预防感冒可能引发的过敏。","v":"极易发"},"ganmao":{"des":"各项气象条件适宜，无明显降温过程，发生感冒机率较低。","v":"少发"},"ziwaixian":{"des":"属弱紫外线辐射天气，无需特别防护。若长期在户外，建议涂擦SPF在8-12之间的防晒护肤品。","v":"最弱"},"shushidu":{"des":"白天不太热也不太冷，风力不大，相信您在这样的天气条件下，应会感到比较清爽和舒适。","v":"舒适"}}}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      AqiForecast5days? aqiforecast5days, 
      IndexOfLiving? indexofliving,}){
    _aqiforecast5days = aqiforecast5days;
    _indexofliving = indexofliving;
}

  Data.fromJson(dynamic json) {
    _aqiforecast5days = json['AQI_FORECAST_5DAYS'] != null ? AqiForecast5days.fromJson(json['AQI_FORECAST_5DAYS']) : null;
    _indexofliving = json['INDEX_OF_LIVING'] != null ? IndexOfLiving.fromJson(json['INDEX_OF_LIVING']) : null;
  }
  AqiForecast5days? _aqiforecast5days;
  IndexOfLiving? _indexofliving;
Data copyWith({  AqiForecast5days? aqiforecast5days,
  IndexOfLiving? indexofliving,
}) => Data(  aqiforecast5days: aqiforecast5days ?? _aqiforecast5days,
  indexofliving: indexofliving ?? _indexofliving,
);
  AqiForecast5days? get aqiforecast5days => _aqiforecast5days;
  IndexOfLiving? get indexofliving => _indexofliving;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_aqiforecast5days != null) {
      map['AQI_FORECAST_5DAYS'] = _aqiforecast5days?.toJson();
    }
    if (_indexofliving != null) {
      map['INDEX_OF_LIVING'] = _indexofliving?.toJson();
    }
    return map;
  }

}

/// city : "郑州"
/// life : {"yundong":{"des":"有降水，推荐您在室内进行健身休闲运动；若坚持户外运动，须注意携带雨具并注意避雨防滑。","v":"较不宜"},"chuanyi":{"des":"建议着长袖T恤、衬衫加单裤等服装。年老体弱者宜着针织长袖衬衫、马甲和长裤。","v":"舒适"},"xiche":{"des":"不宜洗车，未来24小时内有雨，如果在此期间洗车，雨水和路上的泥水可能会再次弄脏您的爱车。","v":"不宜"},"diaoyu":{"des":"天气不好，不适合垂钓。","v":"不宜"},"kongtiao":{"des":"您将感到很舒适，一般不需要开启空调。","v":"较少开启"},"daisan":{"des":"有降水，请带上雨伞，如果你喜欢雨中漫步，享受大自然给予的温馨和快乐，在短时间外出可收起雨伞。","v":"带伞"},"guomin":{"des":"天气条件极易诱发过敏，有降水，易过敏人群尽量减少外出，如需外出最好穿长衣长裤，预防感冒可能引发的过敏。","v":"极易发"},"ganmao":{"des":"各项气象条件适宜，无明显降温过程，发生感冒机率较低。","v":"少发"},"ziwaixian":{"des":"属弱紫外线辐射天气，无需特别防护。若长期在户外，建议涂擦SPF在8-12之间的防晒护肤品。","v":"最弱"},"shushidu":{"des":"白天不太热也不太冷，风力不大，相信您在这样的天气条件下，应会感到比较清爽和舒适。","v":"舒适"}}

IndexOfLiving indexOfLivingFromJson(String str) => IndexOfLiving.fromJson(json.decode(str));
String indexOfLivingToJson(IndexOfLiving data) => json.encode(data.toJson());
class IndexOfLiving {
  IndexOfLiving({
      String? city, 
      Life? life,}){
    _city = city;
    _life = life;
}

  IndexOfLiving.fromJson(dynamic json) {
    _city = json['city'];
    _life = json['life'] != null ? Life.fromJson(json['life']) : null;
  }
  String? _city;
  Life? _life;
IndexOfLiving copyWith({  String? city,
  Life? life,
}) => IndexOfLiving(  city: city ?? _city,
  life: life ?? _life,
);
  String? get city => _city;
  Life? get life => _life;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = _city;
    if (_life != null) {
      map['life'] = _life?.toJson();
    }
    return map;
  }

}

/// yundong : {"des":"有降水，推荐您在室内进行健身休闲运动；若坚持户外运动，须注意携带雨具并注意避雨防滑。","v":"较不宜"}
/// chuanyi : {"des":"建议着长袖T恤、衬衫加单裤等服装。年老体弱者宜着针织长袖衬衫、马甲和长裤。","v":"舒适"}
/// xiche : {"des":"不宜洗车，未来24小时内有雨，如果在此期间洗车，雨水和路上的泥水可能会再次弄脏您的爱车。","v":"不宜"}
/// diaoyu : {"des":"天气不好，不适合垂钓。","v":"不宜"}
/// kongtiao : {"des":"您将感到很舒适，一般不需要开启空调。","v":"较少开启"}
/// daisan : {"des":"有降水，请带上雨伞，如果你喜欢雨中漫步，享受大自然给予的温馨和快乐，在短时间外出可收起雨伞。","v":"带伞"}
/// guomin : {"des":"天气条件极易诱发过敏，有降水，易过敏人群尽量减少外出，如需外出最好穿长衣长裤，预防感冒可能引发的过敏。","v":"极易发"}
/// ganmao : {"des":"各项气象条件适宜，无明显降温过程，发生感冒机率较低。","v":"少发"}
/// ziwaixian : {"des":"属弱紫外线辐射天气，无需特别防护。若长期在户外，建议涂擦SPF在8-12之间的防晒护肤品。","v":"最弱"}
/// shushidu : {"des":"白天不太热也不太冷，风力不大，相信您在这样的天气条件下，应会感到比较清爽和舒适。","v":"舒适"}

Life lifeFromJson(String str) => Life.fromJson(json.decode(str));
String lifeToJson(Life data) => json.encode(data.toJson());
class Life {
  Life({
      Yundong? yundong, 
      Chuanyi? chuanyi, 
      Xiche? xiche, 
      Diaoyu? diaoyu, 
      Kongtiao? kongtiao, 
      Daisan? daisan, 
      Guomin? guomin, 
      Ganmao? ganmao, 
      Ziwaixian? ziwaixian, 
      Shushidu? shushidu,}){
    _yundong = yundong;
    _chuanyi = chuanyi;
    _xiche = xiche;
    _diaoyu = diaoyu;
    _kongtiao = kongtiao;
    _daisan = daisan;
    _guomin = guomin;
    _ganmao = ganmao;
    _ziwaixian = ziwaixian;
    _shushidu = shushidu;
}

  Life.fromJson(dynamic json) {
    _yundong = json['yundong'] != null ? Yundong.fromJson(json['yundong']) : null;
    _chuanyi = json['chuanyi'] != null ? Chuanyi.fromJson(json['chuanyi']) : null;
    _xiche = json['xiche'] != null ? Xiche.fromJson(json['xiche']) : null;
    _diaoyu = json['diaoyu'] != null ? Diaoyu.fromJson(json['diaoyu']) : null;
    _kongtiao = json['kongtiao'] != null ? Kongtiao.fromJson(json['kongtiao']) : null;
    _daisan = json['daisan'] != null ? Daisan.fromJson(json['daisan']) : null;
    _guomin = json['guomin'] != null ? Guomin.fromJson(json['guomin']) : null;
    _ganmao = json['ganmao'] != null ? Ganmao.fromJson(json['ganmao']) : null;
    _ziwaixian = json['ziwaixian'] != null ? Ziwaixian.fromJson(json['ziwaixian']) : null;
    _shushidu = json['shushidu'] != null ? Shushidu.fromJson(json['shushidu']) : null;
  }
  Yundong? _yundong;
  Chuanyi? _chuanyi;
  Xiche? _xiche;
  Diaoyu? _diaoyu;
  Kongtiao? _kongtiao;
  Daisan? _daisan;
  Guomin? _guomin;
  Ganmao? _ganmao;
  Ziwaixian? _ziwaixian;
  Shushidu? _shushidu;
Life copyWith({  Yundong? yundong,
  Chuanyi? chuanyi,
  Xiche? xiche,
  Diaoyu? diaoyu,
  Kongtiao? kongtiao,
  Daisan? daisan,
  Guomin? guomin,
  Ganmao? ganmao,
  Ziwaixian? ziwaixian,
  Shushidu? shushidu,
}) => Life(  yundong: yundong ?? _yundong,
  chuanyi: chuanyi ?? _chuanyi,
  xiche: xiche ?? _xiche,
  diaoyu: diaoyu ?? _diaoyu,
  kongtiao: kongtiao ?? _kongtiao,
  daisan: daisan ?? _daisan,
  guomin: guomin ?? _guomin,
  ganmao: ganmao ?? _ganmao,
  ziwaixian: ziwaixian ?? _ziwaixian,
  shushidu: shushidu ?? _shushidu,
);
  Yundong? get yundong => _yundong;
  Chuanyi? get chuanyi => _chuanyi;
  Xiche? get xiche => _xiche;
  Diaoyu? get diaoyu => _diaoyu;
  Kongtiao? get kongtiao => _kongtiao;
  Daisan? get daisan => _daisan;
  Guomin? get guomin => _guomin;
  Ganmao? get ganmao => _ganmao;
  Ziwaixian? get ziwaixian => _ziwaixian;
  Shushidu? get shushidu => _shushidu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_yundong != null) {
      map['yundong'] = _yundong?.toJson();
    }
    if (_chuanyi != null) {
      map['chuanyi'] = _chuanyi?.toJson();
    }
    if (_xiche != null) {
      map['xiche'] = _xiche?.toJson();
    }
    if (_diaoyu != null) {
      map['diaoyu'] = _diaoyu?.toJson();
    }
    if (_kongtiao != null) {
      map['kongtiao'] = _kongtiao?.toJson();
    }
    if (_daisan != null) {
      map['daisan'] = _daisan?.toJson();
    }
    if (_guomin != null) {
      map['guomin'] = _guomin?.toJson();
    }
    if (_ganmao != null) {
      map['ganmao'] = _ganmao?.toJson();
    }
    if (_ziwaixian != null) {
      map['ziwaixian'] = _ziwaixian?.toJson();
    }
    if (_shushidu != null) {
      map['shushidu'] = _shushidu?.toJson();
    }
    return map;
  }

}

/// des : "白天不太热也不太冷，风力不大，相信您在这样的天气条件下，应会感到比较清爽和舒适。"
/// v : "舒适"

Shushidu shushiduFromJson(String str) => Shushidu.fromJson(json.decode(str));
String shushiduToJson(Shushidu data) => json.encode(data.toJson());
class Shushidu {
  Shushidu({
      String? des, 
      String? v,}){
    _des = des;
    _v = v;
}

  Shushidu.fromJson(dynamic json) {
    _des = json['des'];
    _v = json['v'];
  }
  String? _des;
  String? _v;
Shushidu copyWith({  String? des,
  String? v,
}) => Shushidu(  des: des ?? _des,
  v: v ?? _v,
);
  String? get des => _des;
  String? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['des'] = _des;
    map['v'] = _v;
    return map;
  }

}

/// des : "属弱紫外线辐射天气，无需特别防护。若长期在户外，建议涂擦SPF在8-12之间的防晒护肤品。"
/// v : "最弱"

Ziwaixian ziwaixianFromJson(String str) => Ziwaixian.fromJson(json.decode(str));
String ziwaixianToJson(Ziwaixian data) => json.encode(data.toJson());
class Ziwaixian {
  Ziwaixian({
      String? des, 
      String? v,}){
    _des = des;
    _v = v;
}

  Ziwaixian.fromJson(dynamic json) {
    _des = json['des'];
    _v = json['v'];
  }
  String? _des;
  String? _v;
Ziwaixian copyWith({  String? des,
  String? v,
}) => Ziwaixian(  des: des ?? _des,
  v: v ?? _v,
);
  String? get des => _des;
  String? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['des'] = _des;
    map['v'] = _v;
    return map;
  }

}

/// des : "各项气象条件适宜，无明显降温过程，发生感冒机率较低。"
/// v : "少发"

Ganmao ganmaoFromJson(String str) => Ganmao.fromJson(json.decode(str));
String ganmaoToJson(Ganmao data) => json.encode(data.toJson());
class Ganmao {
  Ganmao({
      String? des, 
      String? v,}){
    _des = des;
    _v = v;
}

  Ganmao.fromJson(dynamic json) {
    _des = json['des'];
    _v = json['v'];
  }
  String? _des;
  String? _v;
Ganmao copyWith({  String? des,
  String? v,
}) => Ganmao(  des: des ?? _des,
  v: v ?? _v,
);
  String? get des => _des;
  String? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['des'] = _des;
    map['v'] = _v;
    return map;
  }

}

/// des : "天气条件极易诱发过敏，有降水，易过敏人群尽量减少外出，如需外出最好穿长衣长裤，预防感冒可能引发的过敏。"
/// v : "极易发"

Guomin guominFromJson(String str) => Guomin.fromJson(json.decode(str));
String guominToJson(Guomin data) => json.encode(data.toJson());
class Guomin {
  Guomin({
      String? des, 
      String? v,}){
    _des = des;
    _v = v;
}

  Guomin.fromJson(dynamic json) {
    _des = json['des'];
    _v = json['v'];
  }
  String? _des;
  String? _v;
Guomin copyWith({  String? des,
  String? v,
}) => Guomin(  des: des ?? _des,
  v: v ?? _v,
);
  String? get des => _des;
  String? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['des'] = _des;
    map['v'] = _v;
    return map;
  }

}

/// des : "有降水，请带上雨伞，如果你喜欢雨中漫步，享受大自然给予的温馨和快乐，在短时间外出可收起雨伞。"
/// v : "带伞"

Daisan daisanFromJson(String str) => Daisan.fromJson(json.decode(str));
String daisanToJson(Daisan data) => json.encode(data.toJson());
class Daisan {
  Daisan({
      String? des, 
      String? v,}){
    _des = des;
    _v = v;
}

  Daisan.fromJson(dynamic json) {
    _des = json['des'];
    _v = json['v'];
  }
  String? _des;
  String? _v;
Daisan copyWith({  String? des,
  String? v,
}) => Daisan(  des: des ?? _des,
  v: v ?? _v,
);
  String? get des => _des;
  String? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['des'] = _des;
    map['v'] = _v;
    return map;
  }

}

/// des : "您将感到很舒适，一般不需要开启空调。"
/// v : "较少开启"

Kongtiao kongtiaoFromJson(String str) => Kongtiao.fromJson(json.decode(str));
String kongtiaoToJson(Kongtiao data) => json.encode(data.toJson());
class Kongtiao {
  Kongtiao({
      String? des, 
      String? v,}){
    _des = des;
    _v = v;
}

  Kongtiao.fromJson(dynamic json) {
    _des = json['des'];
    _v = json['v'];
  }
  String? _des;
  String? _v;
Kongtiao copyWith({  String? des,
  String? v,
}) => Kongtiao(  des: des ?? _des,
  v: v ?? _v,
);
  String? get des => _des;
  String? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['des'] = _des;
    map['v'] = _v;
    return map;
  }

}

/// des : "天气不好，不适合垂钓。"
/// v : "不宜"

Diaoyu diaoyuFromJson(String str) => Diaoyu.fromJson(json.decode(str));
String diaoyuToJson(Diaoyu data) => json.encode(data.toJson());
class Diaoyu {
  Diaoyu({
      String? des, 
      String? v,}){
    _des = des;
    _v = v;
}

  Diaoyu.fromJson(dynamic json) {
    _des = json['des'];
    _v = json['v'];
  }
  String? _des;
  String? _v;
Diaoyu copyWith({  String? des,
  String? v,
}) => Diaoyu(  des: des ?? _des,
  v: v ?? _v,
);
  String? get des => _des;
  String? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['des'] = _des;
    map['v'] = _v;
    return map;
  }

}

/// des : "不宜洗车，未来24小时内有雨，如果在此期间洗车，雨水和路上的泥水可能会再次弄脏您的爱车。"
/// v : "不宜"

Xiche xicheFromJson(String str) => Xiche.fromJson(json.decode(str));
String xicheToJson(Xiche data) => json.encode(data.toJson());
class Xiche {
  Xiche({
      String? des, 
      String? v,}){
    _des = des;
    _v = v;
}

  Xiche.fromJson(dynamic json) {
    _des = json['des'];
    _v = json['v'];
  }
  String? _des;
  String? _v;
Xiche copyWith({  String? des,
  String? v,
}) => Xiche(  des: des ?? _des,
  v: v ?? _v,
);
  String? get des => _des;
  String? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['des'] = _des;
    map['v'] = _v;
    return map;
  }

}

/// des : "建议着长袖T恤、衬衫加单裤等服装。年老体弱者宜着针织长袖衬衫、马甲和长裤。"
/// v : "舒适"

Chuanyi chuanyiFromJson(String str) => Chuanyi.fromJson(json.decode(str));
String chuanyiToJson(Chuanyi data) => json.encode(data.toJson());
class Chuanyi {
  Chuanyi({
      String? des, 
      String? v,}){
    _des = des;
    _v = v;
}

  Chuanyi.fromJson(dynamic json) {
    _des = json['des'];
    _v = json['v'];
  }
  String? _des;
  String? _v;
Chuanyi copyWith({  String? des,
  String? v,
}) => Chuanyi(  des: des ?? _des,
  v: v ?? _v,
);
  String? get des => _des;
  String? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['des'] = _des;
    map['v'] = _v;
    return map;
  }

}

/// des : "有降水，推荐您在室内进行健身休闲运动；若坚持户外运动，须注意携带雨具并注意避雨防滑。"
/// v : "较不宜"

Yundong yundongFromJson(String str) => Yundong.fromJson(json.decode(str));
String yundongToJson(Yundong data) => json.encode(data.toJson());
class Yundong {
  Yundong({
      String? des, 
      String? v,}){
    _des = des;
    _v = v;
}

  Yundong.fromJson(dynamic json) {
    _des = json['des'];
    _v = json['v'];
  }
  String? _des;
  String? _v;
Yundong copyWith({  String? des,
  String? v,
}) => Yundong(  des: des ?? _des,
  v: v ?? _v,
);
  String? get des => _des;
  String? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['des'] = _des;
    map['v'] = _v;
    return map;
  }

}

/// realtime : {"wid":"00","temperature":"21","direct":"东北风","aqi":"46","humidity":"73","power":"2级","info":"晴"}
/// city : "郑州"
/// future : [{"date":"2023-09-28","wid":{"night":"07","day":"07"},"temperature":"16/25℃","weather":"小雨","direct":"东北风转西北风"},{"date":"2023-09-29","wid":{"night":"01","day":"02"},"temperature":"16/26℃","weather":"阴转多云","direct":"西南风"},{"date":"2023-09-30","wid":{"night":"01","day":"01"},"temperature":"16/26℃","weather":"多云","direct":"东北风"},{"date":"2023-10-01","wid":{"night":"07","day":"02"},"temperature":"16/23℃","weather":"阴转小雨","direct":"东风转南风"},{"date":"2023-10-02","wid":{"night":"07","day":"07"},"temperature":"13/21℃","weather":"小雨","direct":"南风"}]

AqiForecast5days aqiForecast5daysFromJson(String str) => AqiForecast5days.fromJson(json.decode(str));
String aqiForecast5daysToJson(AqiForecast5days data) => json.encode(data.toJson());
class AqiForecast5days {
  AqiForecast5days({
      Realtime? realtime, 
      String? city, 
      List<Future>? future,}){
    _realtime = realtime;
    _city = city;
    _future = future;
}

  AqiForecast5days.fromJson(dynamic json) {
    _realtime = json['realtime'] != null ? Realtime.fromJson(json['realtime']) : null;
    _city = json['city'];
    if (json['future'] != null) {
      _future = [];
      json['future'].forEach((v) {
        _future?.add(Future.fromJson(v));
      });
    }
  }
  Realtime? _realtime;
  String? _city;
  List<Future>? _future;
AqiForecast5days copyWith({  Realtime? realtime,
  String? city,
  List<Future>? future,
}) => AqiForecast5days(  realtime: realtime ?? _realtime,
  city: city ?? _city,
  future: future ?? _future,
);
  Realtime? get realtime => _realtime;
  String? get city => _city;
  List<Future>? get future => _future;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_realtime != null) {
      map['realtime'] = _realtime?.toJson();
    }
    map['city'] = _city;
    if (_future != null) {
      map['future'] = _future?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// date : "2023-09-28"
/// wid : {"night":"07","day":"07"}
/// temperature : "16/25℃"
/// weather : "小雨"
/// direct : "东北风转西北风"

Future futureFromJson(String str) => Future.fromJson(json.decode(str));
String futureToJson(Future data) => json.encode(data.toJson());
class Future {
  Future({
      String? date, 
      Wid? wid, 
      String? temperature, 
      String? weather, 
      String? direct,}){
    _date = date;
    _wid = wid;
    _temperature = temperature;
    _weather = weather;
    _direct = direct;
}

  Future.fromJson(dynamic json) {
    _date = json['date'];
    _wid = json['wid'] != null ? Wid.fromJson(json['wid']) : null;
    _temperature = json['temperature'];
    _weather = json['weather'];
    _direct = json['direct'];
  }
  String? _date;
  Wid? _wid;
  String? _temperature;
  String? _weather;
  String? _direct;
Future copyWith({  String? date,
  Wid? wid,
  String? temperature,
  String? weather,
  String? direct,
}) => Future(  date: date ?? _date,
  wid: wid ?? _wid,
  temperature: temperature ?? _temperature,
  weather: weather ?? _weather,
  direct: direct ?? _direct,
);
  String? get date => _date;
  Wid? get wid => _wid;
  String? get temperature => _temperature;
  String? get weather => _weather;
  String? get direct => _direct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    if (_wid != null) {
      map['wid'] = _wid?.toJson();
    }
    map['temperature'] = _temperature;
    map['weather'] = _weather;
    map['direct'] = _direct;
    return map;
  }

}

/// night : "07"
/// day : "07"

Wid widFromJson(String str) => Wid.fromJson(json.decode(str));
String widToJson(Wid data) => json.encode(data.toJson());
class Wid {
  Wid({
      String? night, 
      String? day,}){
    _night = night;
    _day = day;
}

  Wid.fromJson(dynamic json) {
    _night = json['night'];
    _day = json['day'];
  }
  String? _night;
  String? _day;
Wid copyWith({  String? night,
  String? day,
}) => Wid(  night: night ?? _night,
  day: day ?? _day,
);
  String? get night => _night;
  String? get day => _day;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['night'] = _night;
    map['day'] = _day;
    return map;
  }

}

/// wid : "00"
/// temperature : "21"
/// direct : "东北风"
/// aqi : "46"
/// humidity : "73"
/// power : "2级"
/// info : "晴"

Realtime realtimeFromJson(String str) => Realtime.fromJson(json.decode(str));
String realtimeToJson(Realtime data) => json.encode(data.toJson());
class Realtime {
  Realtime({
      String? wid, 
      String? temperature, 
      String? direct, 
      String? aqi, 
      String? humidity, 
      String? power, 
      String? info,}){
    _wid = wid;
    _temperature = temperature;
    _direct = direct;
    _aqi = aqi;
    _humidity = humidity;
    _power = power;
    _info = info;
}

  Realtime.fromJson(dynamic json) {
    _wid = json['wid'];
    _temperature = json['temperature'];
    _direct = json['direct'];
    _aqi = json['aqi'];
    _humidity = json['humidity'];
    _power = json['power'];
    _info = json['info'];
  }
  String? _wid;
  String? _temperature;
  String? _direct;
  String? _aqi;
  String? _humidity;
  String? _power;
  String? _info;
Realtime copyWith({  String? wid,
  String? temperature,
  String? direct,
  String? aqi,
  String? humidity,
  String? power,
  String? info,
}) => Realtime(  wid: wid ?? _wid,
  temperature: temperature ?? _temperature,
  direct: direct ?? _direct,
  aqi: aqi ?? _aqi,
  humidity: humidity ?? _humidity,
  power: power ?? _power,
  info: info ?? _info,
);
  String? get wid => _wid;
  String? get temperature => _temperature;
  String? get direct => _direct;
  String? get aqi => _aqi;
  String? get humidity => _humidity;
  String? get power => _power;
  String? get info => _info;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wid'] = _wid;
    map['temperature'] = _temperature;
    map['direct'] = _direct;
    map['aqi'] = _aqi;
    map['humidity'] = _humidity;
    map['power'] = _power;
    map['info'] = _info;
    return map;
  }

}