import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:buildBoardingItem(),
    );
  }


  Widget buildBoardingItem()=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
    [
      Expanded(
        child: Image(
          image: AssetImage('assets/images/onboard_2'),
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        'Screen Title',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        'Screen Body',
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      // PageView.builder(itemBuilder: (context,index)=>)
    ],
  );
}
