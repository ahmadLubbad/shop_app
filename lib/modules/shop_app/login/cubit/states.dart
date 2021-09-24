abstract class LoginState {}

class ShopLoginInitialState extends LoginState{}

class ShopLoginLoadingState extends LoginState{}

class ShopLoginSuccessState extends LoginState{}

class ShopLoginErrorState extends LoginState{

  final String error;

  ShopLoginErrorState(this.error);
}