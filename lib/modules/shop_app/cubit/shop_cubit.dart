import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/modules/shop_app/categories/categories_screen.dart';
import 'package:shop_app/modules/shop_app/cubit/state.dart';
import 'package:shop_app/modules/shop_app/favorites/favorites_screen.dart';
import 'package:shop_app/modules/shop_app/product/product_screen.dart';
import 'package:shop_app/modules/shop_app/settings/setting_screen.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/shared/constants.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit():super(ShopInitialState());

  static ShopCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget>bottomScreens =[
    ProductScreen(),
    CategoriesScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ];

  void changeBottom(int index)
  {
    currentIndex=index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel homeModel;

  void getHomeData()
  {
    emit(ShopLoadingHomeDataState());
    
    DioHelper.getData(
        url: Home,
      token: token,
    ).then((value)
    {

      var response = value.data;
      print(response['data']['banners'][0]['image']);

      homeModel=HomeModel.fromJason(value.data);
      printFullText(homeModel.data.banners[0].image);
      printFullText(homeModel.data.banners.toString());

      emit(ShopSuccessHomeDataState());
    }).catchError((error)
    {
      print(error);
      emit(ShopErrorHomeDataState());
    });
  }



}

