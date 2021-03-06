import 'package:flutter/material.dart';
import 'package:shop_app/modules/shop_app/login/login_screen.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/shared/componentes.dart';

void signOut(context)
{
  CacheHelper.removeData(key: 'token').then((value){
    if(value)
    {
      navigateAndFinish(context, LoginScreen());
    }
  });





}

void printFullText(String text)
{
   final pattern=RegExp('.{1,800}');
   pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token='';


Widget myDivider()=>Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(

    width: double.infinity,

    height: 1,

    color: Colors.grey[300],

  ),
);