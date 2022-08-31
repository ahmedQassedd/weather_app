class DailyWeatherModel {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  dynamic visibility;
  Wind? wind;
  Clouds? clouds;
  dynamic dt;
  Sys? sys;
  dynamic timezone;
  dynamic id;
  String? name;
  dynamic cod;



  DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    coord = Coord.fromJson(json['coord']) ;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather?.add( Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = Main.fromJson(json['main']) ;
    visibility = json['visibility'];
    wind =  Wind.fromJson(json['wind']) ;
    clouds = Clouds.fromJson(json['clouds']) ;
    dt = json['dt'];
    sys = Sys.fromJson(json['sys']) ;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }


}

class Coord {
  dynamic lon;
  dynamic lat;



  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }


}

class Weather {
  dynamic id;
  String? main;
  String? description;
  String? icon;


  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }


}

class Main {
  dynamic temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  dynamic pressure;
  dynamic humidity;



  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }


}

class Wind {
  dynamic speed;
  dynamic deg;



  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }


}

class Clouds {
  dynamic all;



  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }


}

class Sys {
  dynamic type;
  dynamic id;
  String? country;
  dynamic sunrise;
  dynamic sunset;


  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }


}




