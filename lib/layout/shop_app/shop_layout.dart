import 'package:flutter/material.dart';
import 'package:shop_app/modules/shop_app/login/login_screen.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/shared/componentes.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salla'),
      ),
      body: TextButton(
        onPressed:()
        {
          CacheHelper.removeData(key: 'token').then((value){
            if(value)
            {
              navigateAndFinish(context, LoginScreen());
            }
          });
        } ,
        child: Text('SING OUT'),
      ),
    );
  }
}
