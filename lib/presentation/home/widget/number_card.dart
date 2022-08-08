import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constatnt.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget({Key? key, required this.index,required this.imageUrl}) : super(key: key);
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(width: 30),
            Container(
              decoration: BoxDecoration(
                  borderRadius: kBorder20,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(imageUrl

                          ))),
              width: 150,
              height: 250,
            ),
          ],
        ),
        Positioned(
            left: 10,
            bottom: -10,
            child: BorderedText(
                strokeWidth: 10,
                strokeColor: kWhiteColor,
                child: Text(
                  "${index + 1}",
                  style: TextStyle(
                      color: kBlackColor,
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      decorationColor: Colors.black),
                )))
      ],
    );
  }
}
