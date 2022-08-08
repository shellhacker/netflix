import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/domain/core/debounce/debounce.dart';
import 'package:netflix/presentation/search/widget/search_idle.dart';
import 'package:netflix/presentation/search/widget/searchresult.dart';

class ScreenSreach extends StatelessWidget {
   ScreenSreach({Key? key}) : super(key: key);

  final debouncer= Debouncer(milliseconds: 1*1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon:
                  Icon(CupertinoIcons.xmark_circle_fill, color: Colors.grey),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {

                if(value.isEmpty){
                  return;

                }
                debouncer.run(() { 
                  BlocProvider.of<SearchBloc>(context)
                    .add(SearchMovie(movieQuery: value));

                });


                
              },
            ),
            kHeight,

            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if(state.searchResultList.isEmpty){
                   return SearchIdelWidget();

                }else{
                  return SearchResultWidget();   
                }
               
              },
            ))
            // Expanded(child: SearchResultWidget())
          ],
        ),
      )),
    );
  }
}
