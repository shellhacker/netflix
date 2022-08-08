import 'package:flutter/material.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/home/widget/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveroneWactching extends StatelessWidget {
  const EveroneWactching({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text('Friends',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        kHeight,
        Text(
            style: TextStyle(fontSize: 13),
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1ljgMsp7yuvOd7uC-Gdtd5LI4aCxhC3h3aA&usqp=CAU'),
        kHeight50,
        VideoWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.share,
              title: 'Share',
              iconSize: 30,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 30,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 30,
              textSize: 16,
            ),
            kwidth,
          ],
        )
      ],
    );
  }
}
