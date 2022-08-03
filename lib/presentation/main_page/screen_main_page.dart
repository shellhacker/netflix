import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/dawonloads/screen_downloads.dart';
import 'package:netflix/presentation/fast_laughs/fast_laughs.dart';
import 'package:netflix/presentation/home/Screen_Home.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new_and_hot/new_and_hot.dart';
import 'package:netflix/presentation/search/search.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({Key? key}) : super(key: key);


  final _pages=[const ScreenHome(),
  const ScreenNewAndHot(),
  const ScreenFastLaugh(),
  const ScreenSreach(),
  const ScreenDownloads()];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(child: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (BuildContext context, int index,_) {
          return _pages[index];
        },
      ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}