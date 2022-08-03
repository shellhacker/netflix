import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({Key? key, required this.index}) : super(key: key);
final int index; 
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
              CircleAvatar(radius: 30,backgroundColor: Colors.black.withOpacity(0.5),child: IconButton(onPressed: (){}, 
              icon: Icon(Icons.volume_off,size: 30,))),
              Column(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(radius: 30,backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXQbKANxWqb7Fg8ExaQPrprLZD_0XXCrSWsg&usqp=CAU'),),
                ),
                VideoActionsWidget(icon: Icons.emoji_emotions, title: 'LoL'),
                VideoActionsWidget(icon: Icons.add, title: 'My List'),
                VideoActionsWidget(icon: Icons.share, title: 'Share'),
                VideoActionsWidget(icon: Icons.play_arrow, title: 'Play'),
                



              ],)
            
            
            
            ],),
          ),
        )

      ],
    );

  }
}


class VideoActionsWidget extends StatelessWidget {
  const VideoActionsWidget({Key? key, required this.icon, required this.title}) : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        children: [
          Icon(icon,color: Colors.white,size: 30,),
          Text(title,style: TextStyle(color: kWhiteColor,fontSize: 16),)

        ],
      ),
    );
  }
}