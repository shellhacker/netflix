import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/search/widget/title.dart';

final imgUrl =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSunX0OwLM2gJB0xzpfdznS6aZR45Wz0thi_A&usqp=CAU';

class SearchIdelWidget extends StatelessWidget {
  const SearchIdelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(
              title: 'Top Search',
            ),
            kHeight,
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if(state.isLoading){
                    return Center(child: CircularProgressIndicator(),);
                  }else if(state.isError){
                    return Center(child: Text('Error while getting data'),);

                  }else if(state.idleList.isEmpty){
                    return Center(child: Text('List is empty'));

                  }
                  return ListView.separated(
                      itemBuilder: (ctx, index) {
                        final movie= state.idleList[index];
                        return TopSerchItemTile(title: movie.title??"No title", imagUrl: '$imageAppendUrl${movie.posterPath}');

                      },
                      separatorBuilder: (ctx, index) => kHeight,
                      itemCount: state.idleList.length);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopSerchItemTile extends StatelessWidget {

  final String title;
  final String imagUrl;
  const TopSerchItemTile({Key? key, required this.title, required this.imagUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Row(
        children: [
          Container(
              width: screenWidth * 0.35,
              height: 90,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imagUrl), fit: BoxFit.cover))),
                      kwidth,
          Expanded(
              child: Text(
            title,
            style: TextStyle(
                fontSize: 16, color: kWhiteColor, fontWeight: FontWeight.bold),
          )),
          CircleAvatar(
            radius: 27,
            backgroundColor: kWhiteColor,
            child: CircleAvatar(
              backgroundColor: kBlackColor,
              radius: 25,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                    color: kWhiteColor,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
