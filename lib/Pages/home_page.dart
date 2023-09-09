import 'package:flutter/Material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:weathersample/Model/weather_Model.dart';
import 'package:weathersample/Provider/theme_provi.dart';
import 'package:weathersample/Theme/weather_theme.dart';
import 'package:weathersample/services/weather_api.dart';
import 'package:weathersample/widgets/homepage_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scafoldbackground = Theme.of(context).scaffoldBackgroundColor;
    final appbarcolor = Theme.of(context).appBarTheme.backgroundColor;
    final themeState = Provider.of<DarkthemeProvider>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: scafoldbackground,
        appBar: AppBar(
            elevation: 0,
            actions: [
              FlutterSwitch(
                  width: 50,
                  height: 30,
                  value: themeState.getDarktheme,
                  onToggle: (bool value) {
                    themeState.setDarktheme = value;
                  }),
            ],
            backgroundColor: appbarcolor),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      homeweather(
                          '${data?.temperature?.toInt()}',
                          '${data?.cityname}',
                          '${data?.maximumtemp?.toInt()}',
                          '${data?.minimumtemp?.toInt()}',
                          '${data?.discription}',
                          context)
                    ],
                  ));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Container();
            }
          },
        ),
        bottomNavigationBar: GNav(
          tabs: [
          GButton(icon: home),
          GButton(
            icon: search,
            onPressed: () {
              Navigator.pushNamed(context, 'SearchPage');
            },
          ),
          GButton(icon: report),
          GButton(icon: profile),
        ]));
  }
}

bool onpress = false;
WeatherApiCliant cliant = WeatherApiCliant();
Weather? data;
final hour = DateTime.now().hour;

Future<void> getData() async {
  data = await cliant.getCurrentWeather("Malappuram");
}
