import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/home/widget/custom_button_widget.dart';

class BackgroundCardWidget extends StatelessWidget {
  const BackgroundCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
       children: [
         Container(width: double.infinity,height: 600,
         decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,
         image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiTn-jUG-gn-rlPCiFHeM1bJB0tJX6mWiJ8w&usqp=CAU'))),
         ),
         Positioned(bottom: 0,left: 0,right: 0,
           child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
            CustomButtonWidget(icon: Icons.add, title: 'My List'),
            _PlayButton(),
            CustomButtonWidget(icon: Icons.info_outline, title: 'Info')
            
         
           ],),
         )
       ],
     );
  }

   TextButton _PlayButton() {
    return TextButton.icon(style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kWhiteColor)),onPressed: (){}, 
            icon: Icon(Icons.play_arrow,size: 30,color: kBlackColor,),
           label: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: Text('Play',style: TextStyle(fontSize: 20,color: kBlackColor),),
           ));
  }
}