// ignore_for_file: non_constant_identifier_names, file_names

class WeatherModel {
  final String cityName;
  final String date;
  final String? image; // the image may be Null
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String WeatherCondition;

  WeatherModel(
      // constructor                     (Api (ison Data))  مينفعش استخدم الكونستراكتور العادي لانه بيبني الاوبجكت من بيانات جايه من اليوزر لكن ال الفاكتوري كونتستراكتور بيبني الاوبجكت ببياناتا جايه من ال اي بي اي
      {required this.cityName,
      required this.date,
      this.image,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.WeatherCondition});

 factory WeatherModel.fromJson(json) {
  return WeatherModel(
    cityName: json["location"]["name"] ?? "Unknown city", // Use a default value if name is missing
    image: json['forecast']?['forecastday']?[0]['day']?['condition']?['icon'], // Safely access nested fields
    date: json["current"]?["last_updated"] ?? "N/A",
    temp: json["forecast"]?["forecastday"]?[0]["day"]?["avgtemp_c"] ?? 0.0,
    maxtemp: json["forecast"]?["forecastday"]?[0]["day"]?["maxtemp_c"] ?? 0.0,
    mintemp: json["forecast"]?["forecastday"]?[0]["day"]?["mintemp_c"] ?? 0.0,
    WeatherCondition: json['forecast']?['forecastday']?[0]['day']?['condition']?['text'] ?? "N/A",
  );
}

}
