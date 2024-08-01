

import 'package:flutter/material.dart';


class Pagedata extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  const Pagedata({super.key,required this.title, required this.price,required this.image,required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(20),
      padding:const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadiusDirectional.circular(25),
      ),
      child: Column(
        children: [
          Text(title,style: Theme.of(context).primaryTextTheme.titleMedium),
          Text('\$$price',style: Theme.of(context).primaryTextTheme.titleSmall),
          Center(
            child:  Image(
              image: AssetImage(image),
              height: 250,
              )
            ),
            
        ],
        ),
    );
  }
}