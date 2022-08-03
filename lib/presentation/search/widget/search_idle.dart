import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/search/widget/title.dart';

  final imgUrl='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSunX0OwLM2gJB0xzpfdznS6aZR45Wz0thi_A&usqp=CAU';

class SearchIdelWidget extends StatelessWidget {
   const SearchIdelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           TitleWidget(title: 'Top Search',),
            kHeight,
            Expanded(
              child: ListView.separated(
              itemBuilder: (ctx,index)=>TopSerchItemTile(),
               
              separatorBuilder: (ctx, index)=>kHeight,
               itemCount: 10),
            )
          
        ],
      
          ),
      ),
      
    );
  }
}




class TopSerchItemTile extends StatelessWidget {
  const TopSerchItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final screenWidth= MediaQuery.of(context).size.width;

    return Expanded(
      child: Row(children: [
        Container(width: screenWidth *0.35 ,
        height: 90,
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(imgUrl),
        fit: BoxFit.cover))
        ),
        Expanded(child: Text('Movie Name',style: TextStyle(fontSize: 16,
        color: kWhiteColor,fontWeight: FontWeight.bold),)),
        CircleAvatar(radius: 27,
          backgroundColor: kWhiteColor,child: CircleAvatar(backgroundColor: kBlackColor,radius: 25,
          child:IconButton(onPressed: (){}, icon:Icon(Icons.play_arrow,color: kWhiteColor,)) ,),)
      ],),
    );
  }
}