class DaysWeatherModel {
  String? cod;
  dynamic message;
  dynamic cnt;
  late List<Listt> list = [] ;
  City? city;


  DaysWeatherModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <Listt>[];
      json['list'].forEach((v) {
        list.add( Listt.fromJson(v));
      });
    }
    city = City.fromJson(json['city']) ;
  }

}

class Listt {
  dynamic dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  dynamic visibility;
  dynamic pop;
  Sys? sys;
  String? dtTxt;



  Listt.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = Main.fromJson(json['main']) ;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add( Weather.fromJson(v));
      });
    }
    clouds = Clouds.fromJson(json['clouds']) ;
    wind =  Wind.fromJson(json['wind']) ;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = Sys.fromJson(json['sys']);
    dtTxt = json['dt_txt'];
  }

}

class Main {
  dynamic temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  dynamic pressure;
  dynamic seaLevel;
  dynamic grndLevel;
  dynamic humidity;
  dynamic tempKf;



  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
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

class Clouds {
  dynamic all;


  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }


}

class Wind {
  dynamic speed;
  dynamic deg;
  dynamic gust;


  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }


}

class Sys {
  String? pod;


  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }


}

class City {
  dynamic id;
  String? name;
  Coord? coord;
  String? country;
  dynamic population;
  dynamic timezone;
  dynamic sunrise;
  dynamic sunset;


  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = Coord.fromJson(json['coord']);
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }


}

class Coord {
  dynamic lat;
  dynamic lon;


  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }


}
