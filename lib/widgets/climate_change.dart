import 'package:flutter/Material.dart';

Widget getClimateImage(String discription) {
  if (discription == 'haze') {
    return Image.asset("Assets/Clear Cloud.png");
  } else if (discription == 'overcast clouds') {
    return Image.asset("Assets/Cloudwithsun.png");
  } else if (discription == 'clear sky') {
    return Image.asset("Assets/Clear Cloud.png");
  } else if (discription == 'light rain') {
    return Image.asset("Assets/Lighting.png");
  } else if (discription == 'mist') {
    return Image.asset("Assets/mist.png");
  } else if (discription == 'broken clouds') {
    return Image.asset("Assets/Cloudwithsun.png");
  } else if (discription == 'light intensity drizzle') {
    return Image.asset("Assets/Raining.png");
  } else if (discription == 'drizzle') {
    return Image.asset("Assets/un mist.png");
  } else {
    return Image.asset("Assets/sun.png");
  }
}
