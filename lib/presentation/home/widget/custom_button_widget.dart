import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
 CustomButtonWidget({
    Key? key,required this.icon,required this.title,this.iconSize=30,this.textSize=18
  }) : super(key: key);
  String title;
  IconData icon;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(onPressed: (){}, 
      icon: Icon(icon,color: kWhiteColor,size: iconSize,)),
      Text(title,style: TextStyle(fontSize: textSize),)
    ],);
  }
}
