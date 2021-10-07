import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/shop_app/cubit/state.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit():super(ShopInitialState());

  static ShopCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;


}