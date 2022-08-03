import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/constatnt.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key ,required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(title,style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900  )),
        Spacer(),
        Icon(Icons.cast,color: Colors.white,),
        kwidth,
        Container(width: 30,
        height: 30,
        color: Colors.blue,),
        kwidth
      ],
    );
  }
}  