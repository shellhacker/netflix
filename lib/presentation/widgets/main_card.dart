import 'package:flutter/material.dart';
import 'package:netflix/core/constatnt.dart';

class MainCardsWidget extends StatelessWidget {
  const MainCardsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: kBorder20,
      image: DecorationImage(
        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxyWdcV3jDpPF6T-yYtRrvYVKGC0J0g6rzVw&usqp=CAU'))),
      width: 150,
      height: 250,
    );
  }
}