import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          builder: (context)=>productBuilder(),
          fallback:(context)=> Center(child: CircularProgressIndicator()),
        );
      },
    );
  }


  Widget productBuilder() => Column(
    children:
    [
      CarouselSlider(
        items: [
          Image(
            image: NetworkImage('https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg'),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
        options: CarouselOptions(),
      ),
    ],
  );
}
