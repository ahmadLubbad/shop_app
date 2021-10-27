import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/modules/shop_app/cubit/shop_cubit.dart';
import 'package:shop_app/modules/shop_app/cubit/state.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).homeModel != null,
          builder: (context)=>productBuilder(ShopCubit.get(context).homeModel),
          fallback:(context)=> Center(child: CircularProgressIndicator()),
        );
      },
    );
  }


  Widget productBuilder(HomeModel model) => Column(
    children:
    [
      CarouselSlider(
        items: model.data.banners.map((e) => Image(
          image: NetworkImage('${e.image}'),
          width: double.infinity,
          fit: BoxFit.cover,
        ),).toList(),
        options: CarouselOptions(
          height: 250.0,
          initialPage: 0,
          viewportFraction: 1.0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          scrollDirection: Axis.horizontal,

        ),
      ),
    ],
  );
}
