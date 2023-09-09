import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathersample/Pages/home_page.dart';
import 'package:weathersample/Pages/search_page.dart';
import 'package:weathersample/Provider/theme_provi.dart';
import 'package:weathersample/Theme/theme_data.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  DarkthemeProvider themechangeProvider = DarkthemeProvider();
  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themechangeProvider.setDarktheme =
        await themechangeProvider.darkthemePrfs.gettheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themechangeProvider;
        })
      ],
      child: Consumer<DarkthemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Style.themeData(themeProvider.getDarktheme, context),
            initialRoute: 'HomePage',
            routes: {
              'HomePage': (context) => const HomePage(),
              'SearchPage': (context) => const SearchPage(),
            },
          );
        },
      ),
    );
  }
}
