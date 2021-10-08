import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/shop_app/cubit/shop_cubit.dart';
import 'package:shop_app/modules/shop_app/cubit/state.dart';
import 'package:shop_app/modules/shop_app/login/login_screen.dart';
import 'package:shop_app/modules/shop_app/search/search_screen.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/shared/componentes.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
      builder: (context, state)
      {

        var cubit=ShopCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text('Salla'),
            actions: [
              IconButton(
                onPressed: ()
                {
                  navigateTo(context, SearchScreen(),);
                },
                icon: Icon(Icons.search),
              )
            ],
          ),
          body:Center(child: cubit.bottomScreens[cubit.currentIndex]),
          bottomNavigationBar: BottomNavigationBar(
            onTap:(index)
            {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category,),
                  label: 'category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite,),
                label: 'favorite'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings,),
                  label: 'setting'
              ),
            ],
          ),
        );
      },
    );
  }
}
