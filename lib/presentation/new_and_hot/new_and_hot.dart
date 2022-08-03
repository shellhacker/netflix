// ignore_for_file: unnecessary_const



import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'widgets/everone_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
              ),
              kwidth,
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              kwidth,
            ],
            bottom: TabBar(
                labelColor: kBlackColor,
                unselectedLabelColor: kWhiteColor,
                isScrollable: true,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator:
                    BoxDecoration(color: kWhiteColor, borderRadius: kBorder30),
                tabs: const [
                  Tab(
                    text: '🍿 Comming soon',
                  ),
                  Tab(
                    text: "👀 Eveyone's watching",
                  )
                ]),
          ),
        ),
        body: TabBarView(
            children: [_buildComingSoon(context), _buildEveryoneWatching()]),
      ),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return ComingSoonWidget();
    });
  }




  Widget _buildEveryoneWatching() {
    return ListView.builder(itemCount: 10,itemBuilder: (context, index){
      return EveroneWactching();
    });
  }
}

