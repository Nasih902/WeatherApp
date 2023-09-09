class Weather {
  String? cityname;
  String? discription;
  double? temperature;
  double? maximumtemp;
  double? minimumtemp;
  double? wind;

  Weather(
    this.cityname,
    this.discription,
    this.temperature,
    this.maximumtemp,
    this.minimumtemp,
    this.wind,
  );
  Weather.fromjson(Map<String, dynamic> json) {
    cityname = json["name"];
    discription = json['weather'][0]['description'];
    temperature = json["main"]["temp"] - 273;
    maximumtemp = json["main"]["temp_max"] - 273;
    minimumtemp = json["main"]["temp_min"] - 273;
  }
}
