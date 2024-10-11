class WeatherForecast {
  final String forecastDate;
  final String icon;
  final String iconDescription;
  final double avgHumidity;
  final double avgTempC;
  final double avgTempF;
  final double maxWindMph;
  final double maxWindKph;

  WeatherForecast(
      {
        required this.forecastDate,
        required this.icon,
        required this.iconDescription,
        required this.avgHumidity,
        required this.avgTempC,
        required this.avgTempF,
        required this.maxWindKph,
        required this.maxWindMph});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      forecastDate: json['date'],
      icon: json['day']['condition']['icon'],
      iconDescription: json['day']['condition']['text'],
      avgHumidity: json['day']['avghumidity'],
      avgTempC: json['day']['avgtemp_c'],
      avgTempF: json['day']['avgtemp_f'],
      maxWindMph: json['day']['maxwind_mph'],
      maxWindKph: json['day']['maxwind_kph'],
    );
  }
}
