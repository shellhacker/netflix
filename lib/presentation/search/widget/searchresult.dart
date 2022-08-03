import 'package:flutter/material.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/search/widget/title.dart';


final  imgUrl='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-eSJq42i1Ao2d46ypisPZMl60kwRVbBziaQ&usqp=CAU';

class SearchResultWidget extends StatelessWidget {
   const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           TitleWidget(title: 'Movies and Tv',),
            kHeight,
            Expanded(
              child: GridView.count(crossAxisCount: 3,
              shrinkWrap: true,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1/1.4,
              children: 
                List.generate(20, (index){
                  return MainCard();
                })
              ,
              )
            )
          
        ],
      
          ),
      ),
      
    ); 
  }
}
 

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(image:
     DecorationImage(image: NetworkImage(imgUrl),fit: BoxFit.cover),
     borderRadius: BorderRadius.circular(7)),);
  }
}


