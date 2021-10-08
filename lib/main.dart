import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/shop_layout.dart';
import 'package:shop_app/modules/shop_app/cubit/shop_cubit.dart';
import 'package:shop_app/modules/shop_app/login/login_screen.dart';
import 'package:shop_app/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/styles/themes.dart';

import 'modules/shop_app/login/cubit/bloc_observer.dart';
import 'network/remote/dio_helper.dart';

 void main() async {
   WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

  Bloc.observer=SimpleBlocObserver();

  await CacheHelper.init();

  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');

  if(onBoarding!=null)
  {
    if(token!=null)widget=ShopLayout();
    else widget=LoginScreen();
  }else
    {
      widget=OnBoardingScreen();
    }

  print(onBoarding);

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {

   final Widget startWidget;

   MyApp({this.startWidget});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context)=>ShopCubit()..getHomeData(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
  theme: lightTheme,
        // darkTheme: darkTheme,
        home: startWidget,
      ),
    );
  }
}

