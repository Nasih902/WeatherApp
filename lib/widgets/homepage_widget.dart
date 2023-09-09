import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weathersample/widgets/climate_change.dart';

Widget homeweather(
  String temperature,
  String name,
  String maxtemp,
  String mintemp,
  String discription,
  BuildContext context,
) {
  var currentDate = DateTime.now();
  final largetitle = Theme.of(context).textTheme.titleLarge;
  final mediumtitle = Theme.of(context).textTheme.titleMedium;
  final lablemedium = Theme.of(context).textTheme.labelMedium;
  final lablelarge = Theme.of(context).textTheme.labelLarge;
  final texttheme = Theme.of(context).textTheme.titleSmall;
  final lablesmall = Theme.of(context).textTheme.labelSmall;
  final feildcolor = Theme.of(context).cardColor;
  return Column(
    children: [
      const SizedBox(
        height: 60,
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.60,
        decoration: BoxDecoration(
            color: feildcolor,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$temperature°",
                    style: largetitle,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: mediumtitle,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${DateFormat.MMMM().format(DateTime.now())}-${currentDate.day}",
                    style: lablemedium,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: getClimateImage(discription),
                    //   lightthemeIcon,
                    //   size: 72,
                    //   color: Yellow,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, right: 50),
                    child: Text(
                      'Max Temp : $maxtemp°',
                      style: lablelarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, right: 20),
                    child: Text(
                      'Min Temp : $mintemp°',
                      style: lablelarge,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 50),
                  child: Text(
                    'Discription : $discription',
                    style: lablelarge,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Today',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 100,
                height: 35,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: Theme.of(context)
                        .outlinedButtonTheme
                        .style
                        ?.backgroundColor,
                    textStyle: MaterialStatePropertyAll(lablesmall),
                  ),
                  child: Text(
                    'Veiw All',
                    style: lablesmall,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 26),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: feildcolor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 10,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 80, top: 20),
                          child: Text(
                            "$temperature°",
                            style: texttheme,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80, top: 55),
                          child: Text(
                            DateFormat.j().format(
                                DateTime.now().add(const Duration(hours: 1))),
                            style: texttheme,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 10),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              'Assets/mist.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: feildcolor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 10,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 85, top: 20),
                            child: Text("$temperature°", style: texttheme),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 85, top: 55),
                            child: Text(
                                DateFormat.j().format(DateTime.now()
                                    .add(const Duration(hours: 2))),
                                style: texttheme),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 10),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                'Assets/Raining.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: feildcolor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 10,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 85, top: 20),
                            child: Text("$temperature°", style: texttheme),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 85, top: 55),
                            child: Text(
                                DateFormat.j().format(DateTime.now()
                                    .add(const Duration(hours: 3))),
                                style: texttheme),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 10),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                'Assets/Clear Cloud.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: feildcolor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 10,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 85, top: 20),
                            child: Text("$temperature°", style: texttheme),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 85, top: 55),
                            child: Text(
                                DateFormat.j().format(DateTime.now()
                                    .add(const Duration(hours: 4))),
                                style: texttheme),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 10),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                'Assets/Cloudwithsun.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
