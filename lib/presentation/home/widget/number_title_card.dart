import 'package:flutter/material.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/home/widget/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,required this.posterList
  }) : super(key: key);
  final List<String>posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: 'Top 10 Tv Shows In India Today '),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                posterList.length,
                (index) => NumberCardWidget(imageUrl: posterList[index],
                      index: index,
                    )),
          ),
        )
      ],
    );
  }
}
