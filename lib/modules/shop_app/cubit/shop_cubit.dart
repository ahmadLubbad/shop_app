import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/categories_model.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/modules/shop_app/categories/categories_screen.dart';
import 'package:shop_app/modules/shop_app/cubit/state.dart';
import 'package:shop_app/modules/shop_app/favorites/favorites_screen.dart';
import 'package:shop_app/modules/shop_app/product/product_screen.dart';
import 'package:shop_app/modules/shop_app/settings/setting_screen.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/shared/constants.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductScreen(),
    CategoriesScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel homeModel;

  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: Home,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJason(value.data);

      homeModel.data.products.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });

      print(favorites.toString());

      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJason(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorCategoriesState());
    });
  }

  void changeFavorites(int productId) {
    DioHelper.postData(
        url: FAVORITES,
        data: {
          'product_id': productId
        },
      token: token,
    )
        .then((value)
    {
      emit(ShopSuccessChangeFavoritesState());
    })
        .catchError((error)
    {
          emit(ShopErrorChangeFavoritesState());
    });
  }
}
