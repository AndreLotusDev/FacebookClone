import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/PerfilImage.dart';
import 'package:facebook_interface/data/DataWeb.dart';
import 'package:facebook_interface/models/Models.dart';
import 'package:facebook_interface/utils/CollorPallet.dart';
import 'package:flutter/material.dart';

class HistoryArea extends StatelessWidget {

  final User user;
  final List<Story> stories;

  const HistoryArea({
    Key? key,
    required this.user,
    required this.stories

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(

          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (context, index){

            if(index == 0) {
              Story userStory = Story(user: actualUser, urlImage: actualUser.imageUrl, wasVisualized: true);

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: CardStory(story: userStory, addStory: true),
              );
            }

            Story story = stories[index - 1];

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: CardStory(story: story),
            );
          }),
    );
  }
}

class CardStory extends StatelessWidget {

  final Story story;
  final bool addStory;

  const CardStory({
    Key? key,
    required this.story,
    this.addStory = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: story.urlImage,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),

        Container (
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: CollorPallet.degradeHistory,
            borderRadius: BorderRadius.circular(12)
          ),
        ),

        Positioned(
          top: 8,
          right: 8,
          child: addStory ?

          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.add),
              iconSize: 30,
              color: CollorPallet.BlueFacebook,
              onPressed: () {},
            ),
          )

          :

          PerfilImage(urlImage: story.user.imageUrl, wasVisualized: story.wasVisualized)
        ),

        Positioned(
            bottom: 8 ,
            left: 8,
            right: 8,
            child: addStory ? Container() :
            Text(story.user.name, style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ))
      ],

    );
  }
}

