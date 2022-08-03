import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/search/widget/search_idle.dart';
import 'package:netflix/presentation/search/widget/searchresult.dart';

class ScreenSreach extends StatelessWidget {
  const ScreenSreach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          CupertinoSearchTextField(backgroundColor: Colors.grey.withOpacity(0.4),
            prefixIcon:Icon(CupertinoIcons.search,color: Colors.grey,) ,
            suffixIcon:Icon(CupertinoIcons.xmark_circle_fill,color:Colors.grey) ,
            style: TextStyle(color: Colors.white),
            
            
          ),
          kHeight,
         
          //Expanded(child: SearchIdelWidget())
          Expanded(child: SearchResultWidget())

        ],

    ),
      )),
      
    );
  }
}