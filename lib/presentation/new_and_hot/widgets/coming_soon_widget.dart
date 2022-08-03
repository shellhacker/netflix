import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/home/widget/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
   
        SizedBox(
          width: 50,
          height: 420,
          child: Column(
            children: const [
              Text(
                'Feb',
                style: TextStyle(fontSize: 18, color: kGreyColor),
              ),
              Text(
                '11',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              )
            ],
          ),
        ),
        SizedBox(
          height: 420,
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
              Row(
                children: [
                  Text('TALL GIRL 2',
                      style: TextStyle(
                          fontSize: 30,
                          letterSpacing: -5,
                          fontWeight: FontWeight.bold)),
                  Spacer(),
                  CustomButtonWidget(
                    icon: Icons.notifications,
                    title: 'Remain dMe',
                    iconSize: 20,
                    textSize: 16,
                  ),
                  CustomButtonWidget(
                    icon: Icons.info,
                    title: 'info',
                    iconSize: 20,
                    textSize: 16,
                  )
                ],
              ),
              Text('Coming on Friday'),
              kHeight,
              Text('Tall Girl 2',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              kHeight,
              Text(
                  style: TextStyle(fontSize: 13),
                  'landing the lead in the school musical is a dream\n come true for Jodi,until the pressure sends her\n confidence - and her relatioship - into a \ntailspain.'),
            ],
          ),
        )
      ],
    );
  }
}

