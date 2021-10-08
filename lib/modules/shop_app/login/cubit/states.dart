import 'package:shop_app/model/login_model.dart';

abstract class LoginState {}

class ShopLoginInitialState extends LoginState{}

class ShopLoginLoadingState extends LoginState{}

class ShopLoginSuccessState extends LoginState
{
  final LoginModel loginModel;

  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErrorState extends LoginState{

  final String error;

  ShopLoginErrorState(this.error);
}

class ShopChangPasswordVisibilityState extends LoginState{}