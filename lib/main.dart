import 'package:flutter/material.dart';
import 'package:shop_app/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:shop_app/styles/themes.dart';

import 'network/remote/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
  theme: lightTheme,
      // darkTheme: darkTheme,
      home: OnBoardingScreen(),
    );
  }
}

