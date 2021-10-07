import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/shop_app/categories/categories_screen.dart';
import 'package:shop_app/modules/shop_app/cubit/state.dart';
import 'package:shop_app/modules/shop_app/favorites/favorites_screen.dart';
import 'package:shop_app/modules/shop_app/product/product_screen.dart';
import 'package:shop_app/modules/shop_app/search/search_screen.dart';
import 'package:shop_app/modules/shop_app/settings/setting_screen.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit():super(ShopInitialState());

  static ShopCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget>bottomScreens =[
    ProductScreen(),
    SettingScreen(),
    FavoriteScreen(),
    CategoriesScreen(),
  ];

  void changeBottom(int index)
  {
    currentIndex=index;
    emit(ShopChangeBottomNavState());
  }
}