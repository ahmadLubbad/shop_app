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