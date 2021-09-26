import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/shop_app/login/cubit/states.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<LoginState>{

  ShopLoginCubit():super(ShopLoginInitialState());

  static ShopLoginCubit get(context)=>BlocProvider.of(context);

  void userLogin({
  @required String email,
    @required String password,
})
  {

    emit(ShopLoginLoadingState());

    DioHelper.postData(
        url: Login,
        data: {
          'email':email,
          'password':password,
        },
    ).then((value){
      print(value.data);
      emit(ShopLoginSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword=true;

  void changPasswordVisibility()
  {
    isPassword=!isPassword;

    suffix=isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShopChangPasswordVisibilityState());

  }

}