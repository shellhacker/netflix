import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/bloc/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: "Downloads",
            )),
        body: ListView(
          children: [const _smartdawonloads(), Section2(), const Secion3()],
        ));
  }
}

class _smartdawonloads extends StatelessWidget {
  const _smartdawonloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: kWhiteColor,
            )),
        kwidth,
        const Text('Smart Downloads')
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });

    // BlocProvider.of<DownloadsBloc>(context).add(const DownloadsEvent.getDownloadsImage());

    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "We will download a personalised selection of\n movies and shows for you, so theres always something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        kHeight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return Stack(alignment: Alignment.center, children: [
              CircleAvatar(
                radius: size.width * 0.4,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              DawonloadImageWidgets(
                  imageList: '$imageAppendUrl${state.downloads[0].posterPath}',
                  angle: 25,
                  margin: const EdgeInsets.only(left: 170, bottom: 30),
                  size: Size(
                    size.width * 0.4,
                    size.width * 0.58,
                  )),
              DawonloadImageWidgets(
                  imageList: '$imageAppendUrl${state.downloads[1].posterPath}',
                  angle: -20,
                  margin: const EdgeInsets.only(right: 170, bottom: 30),
                  size: Size(size.width * 0.4, size.width * 0.58)),
              DawonloadImageWidgets(
                  imageList: '$imageAppendUrl${state.downloads[2].posterPath}',
                  radius: 8,
                  margin: const EdgeInsets.only(bottom: 0),
                  size: Size(size.width * 0.4, size.width * 0.65))
            ]);
          },
        ),
      ],
    );
  }
}

class Secion3 extends StatelessWidget {
  const Secion3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            color: kButtonColorBlue,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Setup',
                style: TextStyle(
                    color: kButtonColorWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          onPressed: () {},
          color: kButtonColorWhite,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can dawonload',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class DawonloadImageWidgets extends StatelessWidget {
  const DawonloadImageWidgets({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imageList))),
      ),
    );
  }
}
