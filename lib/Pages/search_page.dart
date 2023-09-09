// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'package:flutter/Material.dart';
import 'package:weathersample/Helper/helper.dart';
import 'package:weathersample/Model/weather_Model.dart';
import 'package:http/http.dart' as http;
import 'package:weathersample/Theme/weather_theme.dart';
import 'package:weathersample/widgets/climate_change.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

Weather? data;

class _SearchPageState extends State<SearchPage> {
  String location = 'Your Place';
  String weatherDescription = 'Sky Status';
  double searchtemperature = 0.0;
  double latitude = 0.00;
  double longitude = 0.00;
  String? country = 'IN';

  Future<void> fetchWeather({required String city}) async {
    final response = await http.get(
      Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=baccf5f8c7764e84570f91467d276965&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      location = city;

      setState(() {
        weatherDescription = data['weather'][0]['description'];
        searchtemperature = data['main']['temp'];
        country = data["sys"]["country"];
        latitude = data["coord"]["lat"];
        longitude = data["coord"]["lon"];
      });
    } else {
      print('Failed to fetch weather data');
    }
  }

  Weather? data;

  @override
  Widget build(BuildContext context) {
    final titletext = Theme.of(context).textTheme.titleLarge;
    final subtitle = Theme.of(context).textTheme.titleMedium;
    final feildcolor = Theme.of(context).cardTheme.color;
    final feildtext = Theme.of(context).textTheme.titleSmall;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Center(
                    child: Text(
                  '$searchtemperature',
                  style: titletext,
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 70,
                      child: getClimateImage(weatherDescription),
                    ),
                  ],
                ),
                Center(
                    child: Text(
                  weatherDescription,
                  style: subtitle,
                )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: feildcolor,
                    ),
                    child: TextField(
                      controller: searchplace,
                      showCursor: false,
                      style: TextStyle(color: white, fontSize: 22),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: white, fontSize: 22),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 2, right: 5),
                          child: Icon(
                            locationIcon,
                            size: 29,
                            color: white,
                          ),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                            top: 2,
                          ),
                          child: Icon(
                            search,
                            size: 29,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    //Container for PlaceName
                    decoration: BoxDecoration(
                        color: feildcolor,
                        borderRadius: const BorderRadius.all(Radius.circular(30))),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 10,
                    child: Center(
                        child: Text(
                      location,
                      style: feildtext,
                    )),
                  ),
                ),
                Padding(
                  //Container for temperature
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: feildcolor,
                        borderRadius: const BorderRadius.all(Radius.circular(30))),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 10,
                    child: Center(
                        child: Text(
                      'Longitude : $longitude',
                      style: feildtext,
                    )),
                  ),
                ),
                Padding(
                  //Container For Pressure
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: feildcolor,
                        borderRadius: const BorderRadius.all(Radius.circular(30))),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 10,
                    child: Center(
                        child: Text(
                      'Latitude : $latitude',
                      style: feildtext,
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                      decoration: BoxDecoration(
                          color: feildcolor,
                          borderRadius: const BorderRadius.all(Radius.circular(30))),
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: MediaQuery.of(context).size.height / 10,
                      child: Center(
                        child: Text(
                          "Country : $country",
                          style: feildtext,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      height: 70,
                      width: 400,
                      child: ElevatedButton(
                          onPressed: () {
                            fetchWeather(city: searchplace.text);
                          },
                          child: const Text("Search Your Place")),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
