import 'package:flutter/material.dart';
import 'package:shop_app/modules/shop_app/login/login_screen.dart';
import 'package:shop_app/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/styles/themes.dart';

import 'network/remote/dio_helper.dart';

 void main() async {
   WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

  await CacheHelper.init();

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');

  print(onBoarding);

  runApp(MyApp(
    onBoarding: onBoarding,
  ));
}

class MyApp extends StatelessWidget {

   final bool onBoarding;
   MyApp({this.onBoarding});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
  theme: lightTheme,
      // darkTheme: darkTheme,
      home: onBoarding ? LoginScreen() : OnBoardingScreen(),
    );
  }
}

