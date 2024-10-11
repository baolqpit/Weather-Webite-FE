class WeatherModelFromDb {
  final int id;
  final String name;
  final String localtime;
  final String icon;
  final double humidity;
  final double tempC;
  final double tempF;
  final double windMph;
  final dynamic windKph;
  final double windDegree;
  final String createdAt;

  WeatherModelFromDb(
      {required this.name,
      required this.id,
      required this.localtime,
      required this.createdAt,
      required this.icon,
      required this.humidity,
      required this.tempC,
      required this.tempF,
      required this.windMph,
      required this.windKph,
      required this.windDegree});

  factory WeatherModelFromDb.fromJson(Map<String, dynamic> json) {
    return WeatherModelFromDb(
      id: json['id'],
      localtime: json['localtime'],
      icon: json['icon'],
      humidity: json['humidity'],
      tempC: json['tempC'],
      tempF: json['tempF'],
      windMph: json['windMph'],
      name: json['name'],
      windKph: json['windKph'],
      windDegree: json['windDegree'],
      createdAt: json['created_at'],
    );
  }
}
