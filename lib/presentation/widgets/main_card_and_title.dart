
import 'package:flutter/material.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainCardAndTitle extends StatelessWidget {
   MainCardAndTitle({
    Key? key,required this.title
  }) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
       children: [
       MainTitle(title: title),
       kHeight,

      LimitedBox(
       maxHeight: 200,
        child: ListView(
         scrollDirection: Axis.horizontal,
         children: 
           List.generate(20, (index) =>  MainCardsWidget())
         ,
        ),
      )
    ],
       
    ),
    );
  }
}