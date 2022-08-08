import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/home/widget/background_card.dart';
import 'package:netflix/presentation/home/widget/number_card.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_card_and_title.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

import 'widget/custom_button_widget.dart';
import 'widget/number_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, index, Widget) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if(state.isLoading){
                          return Center(
                            child:CircularProgressIndicator(strokeWidth: 2,) ,);
                        }else if(state.hasError){
                          return Center(child: Text('Error While getting data',
                          style: TextStyle(color: Colors.white),));

                        }

                        //released past year
                        final _releasedPastYear= state.pastYearMovieList.map((m){
                          return 
                           '$imageAppendUrl${m.backdropPath}';
                        }).toList();
                        

                        // trending
                         final _trending = state.trendingMovieList.map((m){
                          return 
                           '$imageAppendUrl${m.backdropPath}';
                        }).toList();
                        _trending.shuffle();
                        //tense dreams
                         final _tenseDreams= state.tensDramaMovieList.map((m){
                          return 
                           '$imageAppendUrl${m.backdropPath}';
                        }).toList();
                        _tenseDreams.shuffle();
                        //southindian Movies

                         final _southIndianMovies= state.southIndianMovieList.map((m){
                          return 
                           '$imageAppendUrl${m.backdropPath}';
                        }).toList();
                        _southIndianMovies.shuffle();

                        final _topTenMovies=state.trendingMovieList.map((t){
                          return '$imageAppendUrl${t.backdropPath}';
                        }).toList();
                        _topTenMovies.shuffle();




                        return ListView(children: [
                          BackgroundCardWidget(),
                          MainCardAndTitle(
                            title: 'Released in the past year',
                            posterList: _releasedPastYear.sublist(0,10)
                          ),
                          MainCardAndTitle(
                            title: 'Trending Now',
                            posterList: _trending.sublist(0,10),
                          ),
                          kHeight,
                          NumberTitleCard(posterList: _topTenMovies.sublist(0,10),),
                          kHeight,
                          MainCardAndTitle(
                            title: 'Tense Dreams',
                            posterList: _tenseDreams.sublist(0,10),
                          ),
                          kHeight,
                          MainCardAndTitle(
                            title: 'South Indian Cinema',
                            posterList: _southIndianMovies.sublist(0,10),
                          )
                        ]);
                      },
                    ),
                    scrollNotifier.value == true
                        ? Container(
                            width: double.infinity,
                            height: 80,
                            color: Colors.black.withOpacity(0.3),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      "https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png",
                                      width: 50,
                                      height: 50,
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                    ),
                                    kwidth,
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 1000),
                                      width: 30,
                                      height: 30,
                                      color: Colors.blue,
                                    ),
                                    kwidth
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Tv Shows', style: kHomeTitlText),
                                    Text('Movies', style: kHomeTitlText),
                                    Text('Categories', style: kHomeTitlText)
                                  ],
                                )
                              ],
                            ),
                          )
                        : kHeight
                  ],
                ),
              );
            }));
  }
}
