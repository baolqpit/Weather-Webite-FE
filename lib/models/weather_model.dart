class WeatherModel {
  final String name;
  final String localtime;
  final String icon;
  final double humidity;
  final double tempC;
  final double tempF;
  final double windMph;
  final double windKph;
  final double windDegree;

  WeatherModel(
      {required this.name,
      required this.localtime,
      required this.icon,
      required this.humidity,
      required this.tempC,
      required this.tempF,
      required this.windMph,
      required this.windKph,
      required this.windDegree});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      localtime: json['location']['localtime'],
      icon: json['current']['condition']['icon'],
      humidity: json['current']['humidity'],
      tempC: json['current']['temp_c'],
      tempF: json['current']['temp_f'],
      windMph: json['current']['wind_mph'],
      name: json['location']['name'],
      windKph: json['current']['wind_kph'],
      windDegree: json['current']['wind_degree'],
    );
  }
}
